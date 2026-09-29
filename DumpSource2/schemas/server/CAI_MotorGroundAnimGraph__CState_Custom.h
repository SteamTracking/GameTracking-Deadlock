// MGetKV3ClassDefaults = null
// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_Custom : public CAI_MotorGroundAnimGraph::CState
{
	bool m_bFromMovement;
	bool m_bWasMovingOffPath;
	bool m_bRepathed;
	AI_CustomMoveRequest m_request;
};
