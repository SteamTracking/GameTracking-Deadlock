// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_BooleanSwitchState",
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
//	"m_Condition":
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
//	"m_WhenTrue":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	},
//	"m_WhenFalse":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MPropertyFriendlyName = "Monitor Observable"
// MPropertyDescription = "While active, manage child cursors based on the results of a boolean condition. When the observable result changes, the prior cursor will be canceled and the appropriate outflow will fire a new child cursor. Will monitor continuously until externally canceled."
// MPulseEditorCanvasItemSpecKV3 = "{ className = 'IsStateNode' item_factory = 'BooleanSwitchState' }"
// MHasKV3TransferPolymorphicClassname
class CPulseCell_BooleanSwitchState : public CPulseCell_BaseState
{
	// MPropertyDescription = "Condition to evaluate when any of its dependent values change."
	// MPropertyFriendlyName = "Observable"
	CPulseObservableExpression< bool > m_Condition;
	// MPropertyDescription = "Fired when the observable boolean is true, and killed when false."
	// MPropertyFriendlyName = "While True"
	CPulse_OutflowConnection m_WhenTrue;
	// MPropertyDescription = "Fired when the observable boolean is false, and killed when true."
	// MPropertyFriendlyName = "While False"
	CPulse_OutflowConnection m_WhenFalse;
};
