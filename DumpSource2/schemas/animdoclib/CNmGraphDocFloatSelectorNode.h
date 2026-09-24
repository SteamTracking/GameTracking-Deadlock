// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocFloatSelectorNode",
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
//			"m_name": "Option (0.00)",
//			"m_type": "Bool",
//			"m_bIsDynamicPin": true,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Option (0.00)",
//			"m_type": "Bool",
//			"m_bIsDynamicPin": true,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Result",
//			"m_type": "Float",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_options":
//	[
//		{
//			"m_name": "Option",
//			"m_flValue": 0.000000
//		},
//		{
//			"m_name": "Option",
//			"m_flValue": 0.000000
//		}
//	],
//	"m_flDefaultValue": 0.000000,
//	"m_easing": "None",
//	"m_easeTime": 0.300000
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocFloatSelectorNode : public CNmGraphDocFlowNode
{
	// MPropertyAutoExpandSelf
	// MPropertyResizable = 0
	CUtlVector< CNmGraphDocFloatSelectorNode::Option_t > m_options;
	float32 m_flDefaultValue;
	// MPropertyGroupName = "+Easing"
	NmEasingOperation_t m_easing;
	// MPropertyGroupName = "+Easing"
	float32 m_easeTime;
};
