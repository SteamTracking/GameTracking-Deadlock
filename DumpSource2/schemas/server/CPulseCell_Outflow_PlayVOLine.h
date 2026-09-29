// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_Outflow_PlayVOLine",
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
//	"m_OnFinished":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MPropertyFriendlyName = "Play VO Line"
// MPropertyDescription = "Starts a sound event on a speaker, and waits for its completion. Keywords: Voice Over, Choreo"
// MPulseEditorHeaderIcon = "tools/images/pulse_editor/sequence.png"
// MPulseEditorHeaderHelper = "Helper_PlayVOLine"
// MHasKV3TransferPolymorphicClassname
class CPulseCell_Outflow_PlayVOLine : public CPulseCell_BaseYieldingInflow
{
	CPulse_ResumePoint m_OnFinished;
};
