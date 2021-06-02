#include <robot/GeneralizedCoordinatesRobotRepresentation.h>
#include <robot/RBJoint.h>
#include <utils/utils.h>

namespace crl {

GeneralizedCoordinatesRobotRepresentation::
    GeneralizedCoordinatesRobotRepresentation(Robot *a) {
    robot = a;
    resize(q, getDOFCount());
    syncGeneralizedCoordinatesWithRobotState();
}

//returns the total number of degrees of freedom in the reduced representation
int GeneralizedCoordinatesRobotRepresentation::getDOFCount() const {
    //we will have 3 for root position, 3 for root orientation, and then 1 for each joint,
    //assuming they're all hinge joints, which is what this data structure is designed for
    return 6 + (int)robot->jointList.size();
}

//returns the index of the generalized coordinate corresponding to this joint
int GeneralizedCoordinatesRobotRepresentation::getQIdxForJoint(
    RBJoint *joint) const {
    //the root of the robot has a nullptr joint, and as such this should correspond to the first qIdx of the root DOFs
    if (joint == NULL) return 5;
    return 6 + joint->jIndex;
}

//returns the index of the generalized coordinate corresponding to the index of this joint
int GeneralizedCoordinatesRobotRepresentation::getQIdxForJointIdx(
    int jIdx) const {
    return 6 + jIdx;
}

//returns a pointer to the joint corresponding to this generalized coordinate index.
//If the index corresponds to a root DOF, this method will return NULL.
RBJoint *GeneralizedCoordinatesRobotRepresentation::getJointForQIdx(
    int qIdx) const {
    if (qIdx < 6) return NULL;
    return robot->jointList[qIdx - 6];
}

/**
* In the tree-like hierarchy of joints/dofs, this method returns the parent index of the
* dof corresponding to qIdx
*/
int GeneralizedCoordinatesRobotRepresentation::getParentQIdxOf(int qIdx) {
    if (qIdx < 6) return qIdx - 1;
    return getQIdxForJoint(getJointForQIdx(qIdx)->parent->pJoint);
}

// updates q and qDot given current state of robot
void GeneralizedCoordinatesRobotRepresentation::
    syncGeneralizedCoordinatesWithRobotState() {
    // write out the position of the root...
    RobotState state(robot);
    P3D pos = state.getPosition();
    Quaternion orientation = state.getOrientation();

    q[0] = pos.x;
    q[1] = pos.y;
    q[2] = pos.z;

    // Root
    computeEulerAnglesFromQuaternion(orientation, getQAxis(5), getQAxis(4),
                                     getQAxis(3), q[5], q[4], q[3]);

    // Now go through each joint, and decompose it as appropriate...
    for (uint i = 0; i < robot->jointList.size(); i++) {
        int qIdx = getQIdxForJointIdx(i);
        // Only 1-dof hinge joints
        computeRotationAngleFromQuaternion(state.getJointRelativeOrientation(i),
                                           getQAxis(qIdx), q[qIdx]);
    }
}

// returns the axis corresponding to the indexed generalized coordinate,
// expressed in local coordinates
V3D GeneralizedCoordinatesRobotRepresentation::getQAxis(int qIndex) const {
    if (qIndex >= 0 || qIndex < 6) {
        // the first three are the translational dofs of the body
        if (qIndex == 0) return V3D(1, 0, 0);
        if (qIndex == 1) return V3D(0, 1, 0);
        if (qIndex == 2) return V3D(0, 0, 1);
        if (qIndex == 3) return RBGlobals::worldUp;  // y - yaw
        if (qIndex == 4)
            return RBGlobals::worldUp.cross(robot->forward);  // x - pitch
        if (qIndex == 5) return robot->forward;               // z - roll
    }

    return getJointForQIdx(qIndex)->rotationAxis;
}

void GeneralizedCoordinatesRobotRepresentation::
    syncRobotStateWithGeneralizedCoordinates() {
    RobotState rs(robot);
    getReducedRobotState(rs);
    robot->setState(&rs);
}

// given the current state of the generalized representation, output the reduced
// state of the robot
void GeneralizedCoordinatesRobotRepresentation::getReducedRobotState(
    RobotState &state) {
    // set the position, velocity, rotation and angular velocity for the root
    state.setPosition(P3D(0, 0, 0) + getQAxis(0) * q[0] + getQAxis(1) * q[1] +
                      getQAxis(2) * q[2]);
    state.setOrientation(getOrientationFor(robot->root));

    for (uint i = 0; i < robot->jointList.size(); i++) {
        int qIdx = getQIdxForJointIdx(i);
        Quaternion jointOrientation =
            getRotationQuaternion(q[qIdx], getQAxis(qIdx));

        state.setJointRelativeOrientation(jointOrientation, i);
    }
    // and done...
}

// sets the current q values
void GeneralizedCoordinatesRobotRepresentation::setQ(const dVector &qNew) {
    assert(q.size() == qNew.size());
    // NOTE: we don't update the angular velocities. The assumption is that the
    // correct behavior is that the joint relative angular velocities don't
    // change, although the world relative values of the rotations do
    q = qNew;
}

// gets the current q values
void GeneralizedCoordinatesRobotRepresentation::getQ(dVector &q_copy) {
    q_copy = q;
}

void GeneralizedCoordinatesRobotRepresentation::getQFromReducedState(
    const RobotState &rs, dVector &q_copy) {
    dVector q_old = q;

    RobotState oldState(robot);
    robot->setState((RobotState *)&rs);
    syncGeneralizedCoordinatesWithRobotState();
    getQ(q_copy);
    robot->setState(&oldState);

    setQ(q_old);
}

/**
    pLocal is expressed in the coordinate frame of the link that pivots about DOF qIdx.
    This method returns the point in the coordinate frame of the parent of qIdx after
    the DOF rotation has been applied.
*/
P3D GeneralizedCoordinatesRobotRepresentation::
    getCoordsInParentQIdxFrameAfterRotation(int qIndex, const P3D &pLocal) {
    // if qIndex <= 2, this q is a component of position of the base. 
    if (qIndex <= 2) return pLocal;

    // TODO: Ex.1 Forward Kinematics
    // this is a subfunction for getWorldCoordinates() and compute_dpdq()
    // return the point in the coordinate frame of the parent of qIdx after
    // the DOF rotation has been applied.
    // 
    // Hint:
    // - use rotateVec(const V3D &v, double alpha, const V3D &axis) to get a vector 
    // rotated around axis by angle alpha.
    
    // TODO: implement your logic here.

    // Case qIndex = 3,4,5
    if (qIndex <= 5 && qIndex > 2) {
        V3D axis = getQAxis(qIndex);
        return getP3D(rotateVec(V3D(pLocal), q[qIndex], axis));
    } 

    // Case qIndex > 5
    V3D axis = getQAxis(qIndex);
    V3D Vec_cJPos_to_pLocal = V3D(getJointForQIdx(qIndex)->cJPos, pLocal);
    V3D Vec_cJPos_to_pLocal_rotated = rotateVec(Vec_cJPos_to_pLocal, q[qIndex], axis);
    V3D Vec_pJPos_to_pLocal =  Vec_cJPos_to_pLocal_rotated + V3D(getJointForQIdx(qIndex)->pJPos);
    // Note that getJointForQIdx(qIndex)->pJPos is position in world frame
    return P3D(Vec_pJPos_to_pLocal[0], Vec_pJPos_to_pLocal[1], Vec_pJPos_to_pLocal[2]);
}

// returns the world coordinates for point p, which is specified in the local
// coordinates of rb (relative to its COM): p(q)
P3D GeneralizedCoordinatesRobotRepresentation::getWorldCoordinates(const P3D &p, RB *rb) {
    // TODO: Ex.1 Forward Kinematics
    // implement subfunction getCoordsInParentQIdxFrameAfterRotation() first.
    //
    // Hint: you may want to use the following functions
    // - getQIdxForJoint()
    // - getParentQIdxOf()
    // - getCoordsInParentQIdxFrameAfterRotation()

    // TODO: implement your logic here.

    RB *current_rb = rb;
    P3D current_pos = p;

    while(current_rb->pJoint != NULL) {
        current_pos = getCoordsInParentQIdxFrameAfterRotation(getQIdxForJoint(current_rb->pJoint), current_pos);
        current_rb = current_rb->pJoint->parent;
    }

    Eigen::MatrixXd rot_yaw(3,3);
    rot_yaw << cos(q[3]), 0, sin(q[3]), 0, 1, 0, -sin(q[3]), 0, cos(q[3]);
    V3D current_pos_vec(current_pos);
    current_pos_vec = rot_yaw * current_pos_vec + V3D(q[0],q[1],q[2]);
    P3D pInworld = P3D(current_pos_vec[0], current_pos_vec[1], current_pos_vec[2]);
    return pInworld;
}

// returns the global orientation associated with a specific dof q...
Quaternion GeneralizedCoordinatesRobotRepresentation::getWorldRotationForQ(
    int qIndex) {
    Quaternion qRes = Quaternion::Identity();
    // 2 here is the index of the first translational DOF of the root -- these
    // dofs do not contribute to the orientation of the rigid bodies...
    while (qIndex > 2) {
        qRes = getRelOrientationForQ(qIndex) * qRes;
        qIndex = getParentQIdxOf(qIndex);
    }
    return qRes;
}

Quaternion GeneralizedCoordinatesRobotRepresentation::getRelOrientationForQ(
    int qIndex) {
    if (qIndex < 3) return Quaternion::Identity();
    return getRotationQuaternion(q[qIndex], getQAxis(qIndex));
}

// this is a somewhat slow function to use if we must iterate through multiple
// rigid bodies...
V3D GeneralizedCoordinatesRobotRepresentation::getWorldCoordsAxisForQ(
    int qIndex) {
    if (qIndex < 3) return getQAxis(qIndex);
    return getWorldRotationForQ(qIndex) * getQAxis(qIndex);
}

// returns the world-relative orientation for rb
Quaternion GeneralizedCoordinatesRobotRepresentation::getOrientationFor(
    RB *rb) {
    int qIndex = getQIdxForJoint(rb->pJoint);
    return getWorldRotationForQ(qIndex);
}

// computes the jacobian dp/dq that tells you how the world coordinates of p
// change with q. p is expressed in the local coordinates of rb
void GeneralizedCoordinatesRobotRepresentation::compute_dpdq(const P3D &p, RB *rb, Matrix &dpdq) {
    resize(dpdq, 3, (int)q.size());

    // TODO: Ex.4 Analytic Jacobian
    //
    // Hint: you may want to use the following functions
    // - getQIdxForJoint()
    // - getCoordsInParentQIdxFrameAfterRotation()
    // - getQAxis()
    // - rotateVec()
    // - getParentQIdxOf()

    // TODO: your implementation should be here

    // * Col 0, 1, 2
    dpdq.block(0,0,3,3) << Eigen::MatrixXd::Identity(3,3);
    
    // * Col 6 and rest, corresponds to joint DoFs
    int qIdx = getQIdxForJoint(rb->pJoint);
    P3D pLocal = p;
    RBJoint* joint = getJointForQIdx(qIdx);
    P3D I_p_IE = getWorldCoordinates(pLocal, joint->child);
    while (joint != NULL) {
        V3D I_n_i = getWorldCoordsAxisForQ(qIdx); // In world frame
        P3D I_p_Ii = getWorldCoordinates(joint->cJPos, joint->child);
        V3D dpdq_col_i = I_n_i.cross(V3D(I_p_IE) - V3D(I_p_Ii));
        dpdq.block(0,qIdx,3,1) << dpdq_col_i;
        joint = joint->parent->pJoint;
        qIdx = getQIdxForJoint(joint);
    }


    // * Col 3, 4, 5
    Matrix C_roll(3,3), C_pitch(3,3), C_yaw(3,3); 
    C_yaw << cos(q[3]), 0, sin(q[3]), 0, 1, 0, -sin(q[3]), 0, cos(q[3]); // y axis, q[3]
    C_pitch << 1, 0, 0, 0, cos(q[4]), -sin(q[4]), 0, sin(q[4]), cos(q[4]); // x axis, q[4]
    C_roll << cos(q[5]), -sin(q[5]), 0, sin(q[5]), cos(q[5]), 0, 0, 0, 1; // z axis, q[5]
    
    Matrix C_IB(3,3);
    C_IB = C_yaw * C_pitch * C_roll; // We're using YXZ Euler angle
    Matrix C_BI(3,3);
    C_BI = C_IB.ldlt().solve(Eigen::MatrixXd::Identity(3,3));
    Vector3d I_r_BP = V3D(getWorldCoordinates(p,rb)) - V3D(q[0],q[1],q[2]);
    Vector3d B_r_BP = C_BI * I_r_BP;

    // Jacobian coresponds to 345 cols is dot(C_IB)* B_r_BP
    // C_IB = C_yaw * C_pitch * C_roll
    Matrix C_yaw_dot(3,3), C_pitch_dot(3,3), C_roll_dot(3,3), C_IB_dot(3,3);
    C_yaw_dot << -sin(q[3]), 0, cos(q[3]), 0, 0, 0, -cos(q[3]), 0, -sin(q[3]);
    C_pitch_dot << 0, 0, 0, 0, -sin(q[4]), -cos(q[4]), 0, cos(q[4]), -sin(q[4]);
    C_roll_dot << -sin(q[5]), -cos(q[5]), 0, cos(q[5]), -sin(q[5]), 0, 0, 0, 0;

    C_IB_dot.block(0,0,3,1) << C_yaw_dot * C_pitch * C_roll * B_r_BP;
    C_IB_dot.block(0,1,3,1) << C_yaw * C_pitch_dot * C_roll * B_r_BP;
    C_IB_dot.block(0,2,3,1) << C_yaw * C_pitch * C_roll_dot * B_r_BP;
    
    // dpdq.block(0,3,3,3) << C_IB_dot;
    dpdq.block(0,3,3,1) << C_IB_dot.block(0,0,3,1);
}

// estimates the linear jacobian dp/dq using finite differences
void GeneralizedCoordinatesRobotRepresentation::estimate_linear_jacobian(const P3D &p, RB *rb, Matrix &dpdq) {
    resize(dpdq, 3, (int)q.size());

    P3D p_p, p_m;
    V3D dpdq_i(0, 0, 0);
    double val, h = 0.0001;
    for (int i = 0; i < q.size(); i++) {
        val = q[i];

        // TODO: Ex. 2-1 Inverse Kinematics - Jacobian by Finite Difference
        // compute Jacobian matrix dpdq_i by FD and fill dpdq
        q[i] = val + h;
        // TODO: fix this: p(qi + h);
        p_p = getWorldCoordinates(p, rb);

        q[i] = val - h;
        // TODO: fix this: p(qi - h);
        p_m = getWorldCoordinates(p, rb);
        
        // TODO: fix this: compute derivative dp(q)/dqi
        dpdq_i = V3D( (p_p - p_m) / (2*h) );

        // set Jacobian matrix components
        dpdq(0, i) = dpdq_i[0];
        dpdq(1, i) = dpdq_i[1];
        dpdq(2, i) = dpdq_i[2];

        // finally, we don't want to change q[i] value. back to original value.
        q[i] = val;
    }
}

}  // namespace crl
