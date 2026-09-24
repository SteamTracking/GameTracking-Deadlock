// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_GroupNode",
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
//	"m_inputNodeID":
//	{
//		"m_id": 0
//	},
//	"m_outputNodeID":
//	{
//		"m_id": 0
//	},
//	"m_inputConnectionMap":
//	[
//	],
//	"m_nodeMgr":
//	{
//		"_class": "CAnimGraphDoc_NodeManager",
//		"m_nodes":
//		[
//			{
//				"key":
//				{
//					"m_id": 0
//				},
//				"value":
//				{
//					"_class": "",
//					"m_sName": "",
//					"m_vecPosition":
//					[
//						0.000000,
//						0.000000
//					],
//					"m_nNodeID":
//					{
//						"m_id": 0
//					},
//					"m_bDebugThisNode": false,
//					"m_networkMode": "",
//					"m_proxyItems":
//					[
//					]
//				}
//			},
//			{
//				"key":
//				{
//					"m_id": 0
//				},
//				"value":
//				{
//					"_class": "",
//					"m_sName": "",
//					"m_vecPosition":
//					[
//						0.000000,
//						0.000000
//					],
//					"m_nNodeID":
//					{
//						"m_id": 0
//					},
//					"m_bDebugThisNode": false,
//					"m_networkMode": "",
//					"m_proxyItems":
//					[
//					]
//				}
//			}
//		]
//	}
//}
// MPropertyFriendlyName = "Group"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_GroupNode : public CAnimGraphDoc_ContainerNodeBase
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeManager m_nodeMgr;
};
