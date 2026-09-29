// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocTimeControlledClipNode",
//	"m_ID": "",
//	"m_name": "",
//	"m_floatingComment": "",
//	"m_position":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_pChildGraph": null,
//	"m_pSecondaryGraph": null,
//	"m_inputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Time",
//			"m_type": "Float",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Play In Reverse",
//			"m_type": "Bool",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Pose",
//			"m_type": "Pose",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_pDefaultVariationData":
//	{
//		"_class": "CNmGraphDocTimeControlledClipNode::CData",
//		"m_clip": ""
//	},
//	"m_overrides":
//	[
//	],
//	"m_defaultResourceName": "",
//	"m_bSampleRootMotion": true,
//	"m_graphEvents":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocTimeControlledClipNode : public CNmGraphDocVariationDataNode
{
	bool m_bSampleRootMotion;
	// MPropertyGroupName = "Advanced"
	// MPropertyAttributeEditor = "AnimGraphID()"
	// MPropertyAutoExpandSelf
	CUtlVector< CGlobalSymbol > m_graphEvents;
};
