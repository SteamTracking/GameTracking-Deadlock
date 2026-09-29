// MGetKV3ClassDefaults = {
//	"_class": "CNavLinkSubMotor_Legacy_ExternalGraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_tNavLinkTarget": null
//}
// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_Legacy_ExternalGraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamRef< CTransform > m_tNavLinkTarget;
};
