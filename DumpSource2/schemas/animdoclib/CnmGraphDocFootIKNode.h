// MGetKV3ClassDefaults = {
//	"_class": "CnmGraphDocFootIKNode",
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
//			"m_name": "Input",
//			"m_type": "Pose",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Left Foot Target",
//			"m_type": "Target",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Right Foot Target",
//			"m_type": "Target",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Enabled",
//			"m_type": "Bool",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Result",
//			"m_type": "Pose",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_pDefaultVariationData":
//	{
//		"_class": "CnmGraphDocFootIKNode::CData",
//		"m_leftEffectorBoneName": "",
//		"m_rightEffectorBoneName": "",
//		"m_flBlendTimeSeconds": 0.000000
//	},
//	"m_overrides":
//	[
//	],
//	"m_defaultResourceName": "",
//	"m_bIsTargetInWorldSpace": false,
//	"m_blendMode": "Effector"
//}
// MHasKV3TransferPolymorphicClassname
class CnmGraphDocFootIKNode : public CNmGraphDocVariationDataNode
{
	bool m_bIsTargetInWorldSpace;
	NmIKBlendMode_t m_blendMode;
};
