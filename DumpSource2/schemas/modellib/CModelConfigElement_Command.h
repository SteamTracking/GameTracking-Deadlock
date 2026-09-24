// MGetKV3ClassDefaults = {
//	"_class": "CModelConfigElement_Command",
//	"m_ElementName": "",
//	"m_NestedElements":
//	[
//	],
//	"m_Command": "",
//	"m_Args": null
//}
// MHasKV3TransferPolymorphicClassname
class CModelConfigElement_Command : public CModelConfigElement
{
	CUtlString m_Command;
	KeyValues3 m_Args;
};
