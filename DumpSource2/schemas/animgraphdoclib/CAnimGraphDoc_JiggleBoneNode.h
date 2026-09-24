// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_JiggleBoneNode",
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
//	"m_items":
//	[
//	]
//}
// MPropertyFriendlyName = "Jiggle Bone"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_JiggleBoneNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Jiggle Bones"
	// MPropertyAutoExpandSelf
	CUtlVector< CJiggleBoneItem > m_items;
};
