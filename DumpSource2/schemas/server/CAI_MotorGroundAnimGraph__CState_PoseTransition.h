// MGetKV3ClassDefaults = {
//	"_class": "CAI_MotorGroundAnimGraph::CState_PoseTransition",
//	"m_bIsActive": false,
//	"m_bIsUpdating": false,
//	"m_bIsTransitionAllowed": false,
//	"m_bIsSupported": false,
//	"m_nTickActivated": null,
//	"m_nWorldGroupId": null,
//	"m_nDesiredStance": "STANCE_DEFAULT",
//	"m_sDesiredGaitSet": "",
//	"m_sPoseTransitionName": ""
//}
// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph::CState_PoseTransition : public CAI_MotorGroundAnimGraph::CState
{
	StanceType_t m_nDesiredStance;
	CGlobalSymbol m_sDesiredGaitSet;
	CGlobalSymbol m_sPoseTransitionName;
};
