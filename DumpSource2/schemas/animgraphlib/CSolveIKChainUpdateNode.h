// MGetKV3ClassDefaults = {
//	"_class": "CSolveIKChainUpdateNode",
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
//	"m_targetHandles":
//	[
//	],
//	"m_opFixedData":
//	{
//		"m_ChainsToSolveData":
//		[
//		]
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CSolveIKChainUpdateNode : public CUnaryUpdateNode
{
	CUtlVector< CSolveIKTargetHandle_t > m_targetHandles;
	SolveIKChainPoseOpFixedSettings_t m_opFixedData;
};
