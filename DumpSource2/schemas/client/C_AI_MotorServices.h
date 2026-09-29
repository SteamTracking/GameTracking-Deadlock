class C_AI_MotorServices : public CAI_Component
{
	StanceType_t m_nCurrentStance;
	// MNotSaved
	CGlobalSymbol m_sSharedPoseSlotID;
	// MNotSaved
	C_NetworkUtlVectorBase< CTransform > m_vecSharedPoseParentSpace;
};
