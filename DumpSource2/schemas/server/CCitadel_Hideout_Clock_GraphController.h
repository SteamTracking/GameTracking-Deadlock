// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_Hideout_Clock_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_flHour": null,
//	"m_flMinute": null
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_Hideout_Clock_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< float32 > m_flHour;
	CAnimGraph2ParamOptionalRef< float32 > m_flMinute;
};
