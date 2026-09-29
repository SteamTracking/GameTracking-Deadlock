// MGetKV3ClassDefaults = {
//	"_class": "CAI_BaseNPCGraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_sCurrScheduleName": null,
//	"m_sCurrTaskName": null,
//	"m_pszNPCState": null,
//	"m_sCurrMovementName": null
//}
// MHasKV3TransferPolymorphicClassname
class CAI_BaseNPCGraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< CGlobalSymbol > m_sCurrScheduleName;
	CAnimGraphParamRef< CGlobalSymbol > m_sCurrTaskName;
	CAnimGraphParamRef< CGlobalSymbol > m_pszNPCState;
	CAnimGraphParamRef< CGlobalSymbol > m_sCurrMovementName;
};
