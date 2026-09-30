// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_PoseTransition : public CAI_MotorGroundAnimGraph::CState
{
	StanceType_t m_nDesiredStance; // = "STANCE_DEFAULT"
	CGlobalSymbol m_sDesiredGaitSet;
	CGlobalSymbol m_sPoseTransitionName;
};
