// MGetKV3ClassDefaults = {
//	"_class": "CAI_MotorGroundAnimGraph::CState_IdleTurn",
//	"m_bIsActive": false,
//	"m_bIsUpdating": false,
//	"m_bIsTransitionAllowed": false,
//	"m_bIsSupported": false,
//	"m_nTickActivated": null,
//	"m_nWorldGroupId": null,
//	"m_eType": "eAnimated",
//	"m_target":
//	{
//		"m_vPosition": null,
//		"m_flToleranceDegrees": 180.000000
//	},
//	"m_flOriginalAngleDelta": 0.000000,
//	"m_flTurnSpeed": 0.000000,
//	"m_bWasBlockIdleTagActive": false,
//	"m_bHasExplicitTarget": false
//}
// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_IdleTurn : public CAI_MotorGroundAnimGraph::CState
{
	CAI_MotorGroundAnimGraph::CState_IdleTurn::Type_t m_eType;
	CAI_MotorGroundAnimGraph::CState_IdleTurn::Target_t m_target;
	float32 m_flOriginalAngleDelta;
	float32 m_flTurnSpeed;
	bool m_bWasBlockIdleTagActive;
	bool m_bHasExplicitTarget;
};
