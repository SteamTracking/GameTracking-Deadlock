// MGetKV3ClassDefaults = {
//	"_class": "CAI_MotorServices_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_sNavLinkSelection": null,
//	"m_bNavLinkIsOnPath": null,
//	"m_flPathDistanceToNavLink": null,
//	"m_bIsNonZUp": null,
//	"m_flMovementTargetSpeed": null,
//	"m_nNavLinkExternalGraphSlot": 0,
//	"m_sAllowMovementOffPath": "",
//	"m_sAllowMovementOffNavMesh": "",
//	"m_sRestrictMovementToNavMeshDuringCustomMove": ""
//}
// MHasKV3TransferPolymorphicClassname
class CAI_MotorServices_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkSelection;
	CAnimGraphParamRef< bool > m_bNavLinkIsOnPath;
	CAnimGraphParamRef< float32 > m_flPathDistanceToNavLink;
	CAnimGraphParamRef< bool > m_bIsNonZUp;
	CAnimGraphParamRef< float32 > m_flMovementTargetSpeed;
	int32 m_nNavLinkExternalGraphSlot;
	CAnimGraphTagOptionalRef m_sAllowMovementOffPath;
	CAnimGraphTagOptionalRef m_sAllowMovementOffNavMesh;
	CAnimGraphTagOptionalRef m_sRestrictMovementToNavMeshDuringCustomMove;
};
