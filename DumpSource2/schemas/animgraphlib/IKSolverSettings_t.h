class IKSolverSettings_t
{
	// MPropertyFriendlyName = "Solver Type"
	// MPropertyAutoRebuildOnChange
	IKSolverType m_SolverType;
	// MPropertyFriendlyName = "Num Iterations "
	// MPropertyAttrStateCallback
	int32 m_nNumIterations;
	// MPropertyFriendlyName = "End Effector Rotation Behaviour"
	EIKEndEffectorRotationFixUpMode m_EndEffectorRotationFixUpMode;
};
