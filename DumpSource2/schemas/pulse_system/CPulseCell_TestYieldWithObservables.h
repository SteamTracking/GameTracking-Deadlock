// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_TestYieldWithObservables",
//	"m_nEditorNodeID": -1,
//	"m_BaseFlow_OnAfterCancel":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	},
//	"m_BaseFlow_WhileActive":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	},
//	"m_flWatchForFloatValue": 0.000000,
//	"m_LiveFloatValue":
//	{
//		"m_EvaluateConnection":
//		{
//			"m_SourceOutflowName": "",
//			"m_nDestChunk": -1,
//			"m_nInstruction": -1
//		},
//		"m_DependentObservableVars":
//		[
//		],
//		"m_DependentObservableBlackboardReferences":
//		[
//		],
//		"m_DependentObservableTempVars":
//		[
//		]
//	},
//	"m_WatchForStringValue": "",
//	"m_LiveStringValue":
//	{
//		"m_EvaluateConnection":
//		{
//			"m_SourceOutflowName": "",
//			"m_nDestChunk": -1,
//			"m_nInstruction": -1
//		},
//		"m_DependentObservableVars":
//		[
//		],
//		"m_DependentObservableBlackboardReferences":
//		[
//		],
//		"m_DependentObservableTempVars":
//		[
//		]
//	},
//	"m_WakeResume":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CPulseCell_TestYieldWithObservables : public CPulseCell_BaseYieldingInflow
{
	float32 m_flWatchForFloatValue;
	CPulseObservableExpression< float32 > m_LiveFloatValue;
	CUtlString m_WatchForStringValue;
	CPulseObservableExpression< CUtlString > m_LiveStringValue;
	CPulse_ResumePoint m_WakeResume;
};
