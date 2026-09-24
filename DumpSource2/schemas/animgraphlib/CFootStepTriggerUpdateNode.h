// MGetKV3ClassDefaults = {
//	"_class": "CFootStepTriggerUpdateNode",
//	"m_nodePath":
//	{
//		"m_path":
//		[
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			},
//			{
//				"m_id": 0
//			}
//		],
//		"m_nCount": 0
//	},
//	"m_networkMode": "ServerAuthoritative",
//	"m_name": "",
//	"m_pChildNode":
//	{
//		"m_nodeIndex": -1
//	},
//	"m_triggers":
//	[
//	],
//	"m_flTolerance": 0.000000
//}
// MHasKV3TransferPolymorphicClassname
class CFootStepTriggerUpdateNode : public CUnaryUpdateNode
{
	CUtlVector< FootStepTrigger > m_triggers;
	float32 m_flTolerance;
};
