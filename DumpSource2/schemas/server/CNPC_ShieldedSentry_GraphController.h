// MGetKV3ClassDefaults = {
//	"_class": "CNPC_ShieldedSentry_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_flDeployTime": null,
//	"m_eBaseAction": null,
//	"m_flLookHeading": null,
//	"m_flLookPitch": null,
//	"m_bShoot": null
//}
// MHasKV3TransferPolymorphicClassname
class CNPC_ShieldedSentry_GraphController : public CNPC_SimpleAnimatingAI_GraphController
{
	CAnimGraphParamRef< float32 > m_flDeployTime;
	CAnimGraphParamRef< CGlobalSymbol > m_eBaseAction;
	CAnimGraphParamRef< float32 > m_flLookHeading;
	CAnimGraphParamRef< float32 > m_flLookPitch;
	CAnimGraphParamRef< bool > m_bShoot;
};
