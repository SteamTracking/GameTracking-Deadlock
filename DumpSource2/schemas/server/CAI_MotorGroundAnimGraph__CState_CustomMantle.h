// MGetKV3ClassDefaults = {
//	"_class": "CAI_MotorGroundAnimGraph::CState_CustomMantle",
//	"m_bIsActive": false,
//	"m_bIsUpdating": false,
//	"m_bIsTransitionAllowed": false,
//	"m_bIsSupported": false,
//	"m_nTickActivated": null,
//	"m_nWorldGroupId": null,
//	"m_request":
//	{
//		"m_hMantleTarget": null,
//		"m_vStartPositionOffsetLS":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		]
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_CustomMantle : public CAI_MotorGroundAnimGraph::CState
{
	AI_CustomMantleRequest m_request;
};
