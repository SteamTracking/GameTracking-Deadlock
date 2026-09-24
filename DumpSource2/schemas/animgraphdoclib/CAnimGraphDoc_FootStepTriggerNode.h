// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FootStepTriggerNode",
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
//	"m_flTolerance": 1.500000,
//	"m_items":
//	[
//	]
//}
// MPropertyFriendlyName = "Foot Step Trigger"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FootStepTriggerNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Tolerance"
	float32 m_flTolerance;
	// MPropertyFriendlyName = "Feet"
	// MPropertyAutoExpandSelf
	CUtlVector< CFootStepTriggerItem > m_items;
};
