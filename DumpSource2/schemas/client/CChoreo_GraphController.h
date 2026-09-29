// MGetKV3ClassDefaults = {
//	"_class": "CChoreo_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_eChoreoState": null,
//	"m_tChoreoTargetWarp": null,
//	"m_tChoreoExitWarp": null
//}
// MHasKV3TransferPolymorphicClassname
class CChoreo_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eChoreoState;
	CAnimGraph2ParamOptionalRef< CTransform > m_tChoreoTargetWarp;
	CAnimGraph2ParamOptionalRef< CTransform > m_tChoreoExitWarp;
};
