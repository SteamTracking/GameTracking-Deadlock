// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_BreakableProp_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_bHitFlinch": null,
//	"m_bHitReject": null
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_BreakableProp_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< bool > m_bHitFlinch;
	CAnimGraph2ParamOptionalRef< bool > m_bHitReject;
};
