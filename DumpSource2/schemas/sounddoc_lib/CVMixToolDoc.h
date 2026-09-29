// MGetKV3ClassDefaults = {
//	"dsp":
//	{
//		"IsAutomaticDSP": false,
//		"presets":
//		[
//		]
//	},
//	"m_effectsPreview":
//	{
//		"m_previewGraphInput": "",
//		"m_flMix": 1.000000,
//		"m_previewList":
//		{
//			"m_sounds":
//			[
//			],
//			"m_bPreviewInGame": false
//		}
//	},
//	"Graphs":
//	[
//	],
//	"Editor":
//	{
//		"SelectedGraph": -1,
//		"m_nSelectedEffectPreset": -1
//	}
//}
class CVMixToolDoc
{
	// MKV3TransferName = "dsp"
	CVMixToolEffectsList m_dspPresets;
	CEffectsPreviewList m_effectsPreview;
	// MKV3TransferName = "Graphs"
	CUtlVector< CVMixToolGraphEntry > m_graphs;
	// MKV3TransferName = "Editor"
	CVMixToolEditorData m_editorData;
};
