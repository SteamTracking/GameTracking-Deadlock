// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_StanceOverrideNode",
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
//	"m_inputConnection":
//	{
//		"m_nodeID":
//		{
//			"m_id": 0
//		},
//		"m_outputID":
//		{
//			"m_id": 0
//		}
//	},
//	"m_stanceSourceConnection":
//	{
//		"m_nodeID":
//		{
//			"m_id": 0
//		},
//		"m_outputID":
//		{
//			"m_id": 0
//		}
//	},
//	"m_blendParamName": "",
//	"m_blendParamID":
//	{
//		"m_id": 0
//	},
//	"m_eMode": "Sequence",
//	"m_sequenceName": "",
//	"m_nFrameIndex": 0
//}
// MPropertyFriendlyName = "Stance Override"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_StanceOverrideNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_stanceSourceConnection;
	// MPropertySuppressField
	CUtlString m_blendParamName;
	// MPropertyFriendlyName = "Blend Parameter (optional)"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_blendParamID;
	// MPropertyFriendlyName = "Stance Source"
	// MPropertyAutoRebuildOnChange
	StanceOverrideMode m_eMode;
	// MPropertyFriendlyName = "Sequence"
	// MPropertyAttributeChoiceName = "Sequence"
	// MPropertyAttrStateCallback
	CUtlString m_sequenceName;
	// MPropertyFriendlyName = "Frame"
	// MPropertyAttrStateCallback
	int32 m_nFrameIndex;
};
