class CAI_MotorServices : public CAI_Component
{
	CUtlVector< CAI_MotorServices::MotorRegistration_t > m_vecMotors;
	int32 m_nActiveMotorIndex;
	Vector m_vMotorVelocity;
	CGlobalSymbol[5] m_pMovementGaitSetRequests;
	CAI_MotorServices::MovementGaitRequest_t[7] m_pMovementGaitRequests;
	CAI_MotorServices::StanceRequest_t[6] m_pStanceRequests;
	bool[3] m_allowedStances;
	StanceType_t m_nCurrentStance;
	// MNotSaved
	CGlobalSymbol m_sSharedPoseSlotID;
	// MNotSaved
	CNetworkUtlVectorBase< CTransform > m_vecSharedPoseParentSpace;
	CAI_MotorServices::CAI_NullMotor m_nullMotor;
};
