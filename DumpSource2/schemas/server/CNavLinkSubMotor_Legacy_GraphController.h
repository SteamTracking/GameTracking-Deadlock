// MGetKV3ClassDefaults = {
//	"_class": "CNavLinkSubMotor_Legacy_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_vecNavLinkTarget": null,
//	"m_vecNavLinkUp": null,
//	"m_sMovementTransitionForceFacingDisabled": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_Legacy_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< Vector > m_vecNavLinkTarget;
	CAnimGraphParamRef< Vector > m_vecNavLinkUp;
	CAnimGraphTagOptionalRef m_sMovementTransitionForceFacingDisabled;
};
