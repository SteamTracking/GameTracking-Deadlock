// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_IdleTurn : public CAI_MotorGroundAnimGraph::CState
{
	CAI_MotorGroundAnimGraph::CState_IdleTurn::Type_t m_eType; // = "eAnimated"
	CAI_MotorGroundAnimGraph::CState_IdleTurn::Target_t m_target; // = { "m_flToleranceDegrees": 180, "m_vPosition": null }
	float32 m_flOriginalAngleDelta;
	float32 m_flTurnSpeed;
	bool m_bWasBlockIdleTagActive;
	bool m_bHasExplicitTarget;
};
