// MGetKV3ClassDefaults = {
//	"_class": "CAI_AnimGraphServices_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_sTaskHandshakeType": null,
//	"m_sTaskHandshakeTypeShared": null,
//	"m_eTaskHandshakeRestart": null,
//	"m_sTaskHandshakeBodySectionDesired": null,
//	"m_sMovementHandshakeType": null,
//	"m_sMovementHandshakeTypeShared": null,
//	"m_eMovementHandshakeRestart": null,
//	"m_sMovementHandshakeBodySectionDesired": null,
//	"m_sNavLinkType": null,
//	"m_sNavLinkTypeShared": null,
//	"m_vecHitDirection": null,
//	"m_flHitHeading": null,
//	"m_vecHitOffset": null,
//	"m_flHitStrength": null,
//	"m_nHitBone": null
//}
// MHasKV3TransferPolymorphicClassname
class CAI_AnimGraphServices_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< CGlobalSymbol > m_sTaskHandshakeType;
	CAnimGraphParamRef< CGlobalSymbol > m_sTaskHandshakeTypeShared;
	CAnimGraphParamRef< CGlobalSymbol > m_eTaskHandshakeRestart;
	CAnimGraphParamRef< CGlobalSymbol > m_sTaskHandshakeBodySectionDesired;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementHandshakeType;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementHandshakeTypeShared;
	CAnimGraphParamRef< CGlobalSymbol > m_eMovementHandshakeRestart;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementHandshakeBodySectionDesired;
	CAnimGraphParamRef< CGlobalSymbol > m_sNavLinkType;
	CAnimGraphParamRef< CGlobalSymbol > m_sNavLinkTypeShared;
	CAnimGraphParamRef< Vector > m_vecHitDirection;
	CAnimGraphParamRef< float32 > m_flHitHeading;
	CAnimGraphParamRef< Vector > m_vecHitOffset;
	CAnimGraphParamRef< float32 > m_flHitStrength;
	CAnimGraphParamRef< int32 > m_nHitBone;
};
