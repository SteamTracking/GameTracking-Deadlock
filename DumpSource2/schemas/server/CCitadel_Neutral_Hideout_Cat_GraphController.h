// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_Neutral_Hideout_Cat_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_flForwardSpeed": null,
//	"m_flLookHeading": null,
//	"m_flLookPitch": null,
//	"m_flMoveSpeed": null,
//	"m_MoveType": null,
//	"m_BaseAction": null,
//	"m_flRandomSeed": null
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Hideout_Cat_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamRef< float32 > m_flForwardSpeed;
	CAnimGraph2ParamRef< float32 > m_flLookHeading;
	CAnimGraph2ParamRef< float32 > m_flLookPitch;
	CAnimGraph2ParamRef< float32 > m_flMoveSpeed;
	CAnimGraph2ParamRef< CGlobalSymbol > m_MoveType;
	CAnimGraph2ParamRef< CGlobalSymbol > m_BaseAction;
	CAnimGraph2ParamOptionalRef< float32 > m_flRandomSeed;
};
