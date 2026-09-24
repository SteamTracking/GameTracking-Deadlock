// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocBlend1DNode",
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
//			"m_name": "Parameter",
//			"m_type": "Float",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Option (0.00)",
//			"m_type": "Pose",
//			"m_bIsDynamicPin": true,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Option (0.00)",
//			"m_type": "Pose",
//			"m_bIsDynamicPin": true,
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
//	"m_blendSpace":
//	{
//		"m_points":
//		[
//			{
//				"m_name": "Option",
//				"m_flValue": 0.000000,
//				"m_pinID": ""
//			},
//			{
//				"m_name": "Option",
//				"m_flValue": 0.000000,
//				"m_pinID": ""
//			}
//		]
//	},
//	"m_bAllowLooping": true
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocBlend1DNode : public CNmGraphDocFlowNode
{
	// MPropertyAttributeEditor = "BlendSpace1D()"
	CNmBlendSpace1D m_blendSpace;
	// MPropertyDescription = "When not being driven by a sync time, control looping behavior "
	bool m_bAllowLooping;
};
