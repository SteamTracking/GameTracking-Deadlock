// MGetKV3ClassDefaults = {
//	"Name": "",
//	"m_nGraphOutputChannels": -1,
//	"m_bIsMainGraph": false,
//	"m_nPreviewNode": 0,
//	"m_EditorNodes":
//	[
//	],
//	"m_EditorEdges":
//	[
//	],
//	"m_graphPreview":
//	{
//		"m_flVolume": 1.000000,
//		"m_previewList":
//		{
//			"m_sounds":
//			[
//			],
//			"m_bPreviewInGame": false
//		},
//		"m_previewGraphName": ""
//	},
//	"m_EditorState":
//	{
//		"m_viewConfig":
//		{
//			"XAxis":
//			{
//				"pos": 0.000000,
//				"scrollpos": 0,
//				"min": 0.000000,
//				"max": 1.000000,
//				"scale": 1.000000
//			},
//			"YAxis":
//			{
//				"pos": 0.000000,
//				"scrollpos": 0,
//				"min": 0.000000,
//				"max": 1.000000,
//				"scale": 1.000000
//			}
//		}
//	}
//}
class CVMixToolGraphEntry : public CVMixToolGraph
{
	CGraphPreviewList m_graphPreview;
	// MKV3TransferName = "m_EditorState"
	CGraphEditorState m_editorState;
};
