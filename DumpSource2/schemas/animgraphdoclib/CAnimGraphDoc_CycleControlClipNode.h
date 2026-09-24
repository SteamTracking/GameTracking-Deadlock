// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_CycleControlClipNode",
//	"m_sName": "Unnamed",
//	"m_vecPosition":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_nNodeID":
//	{
//		"m_id": 0
//	},
//	"m_bDebugThisNode": false,
//	"m_networkMode": "ServerAuthoritative",
//	"m_tagSpans":
//	[
//	],
//	"m_sequenceName": "",
//	"m_valueSource": "Parameter",
//	"m_paramName": "",
//	"m_param":
//	{
//		"m_id": 0
//	},
//	"m_bLockWhenWaning": false
//}
// MPropertyFriendlyName = "Cycle Control Clip"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_CycleControlClipNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CUtlVector< CSmartPtr< CAnimGraphDoc_TagSpan > > m_tagSpans;
	// MPropertyFriendlyName = "Sequence"
	// MPropertyAttributeChoiceName = "Sequence"
	CUtlString m_sequenceName;
	// MPropertyFriendlyName = "Blend Source"
	// MPropertyAutoRebuildOnChange
	// MPropertyAttrStateCallback
	AnimValueSource m_valueSource;
	// MPropertySuppressField
	CUtlString m_paramName;
	// MPropertyFriendlyName = "Parameter"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_param;
	// MPropertyFriendlyName = "Lock When Waning"
	bool m_bLockWhenWaning;
};
