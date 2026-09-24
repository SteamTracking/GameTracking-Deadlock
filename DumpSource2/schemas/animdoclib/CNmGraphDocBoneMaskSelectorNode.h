// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocBoneMaskSelectorNode",
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
//			"m_name": "ID",
//			"m_type": "ID",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Default Mask",
//			"m_type": "BoneMask",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		},
//		{
//			"m_ID": "",
//			"m_name": "Mask 0",
//			"m_type": "BoneMask",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Result",
//			"m_type": "BoneMask",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_switchDynamically": false,
//	"m_options":
//	[
//		"Mask 0"
//	],
//	"m_flBlendTimeSeconds": 0.100000
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocBoneMaskSelectorNode : public CNmGraphDocFlowNode
{
	bool m_switchDynamically;
	// MPropertyAutoExpandSelf
	// MPropertyResizable = 0
	CUtlVector< CGlobalSymbol > m_options;
	float32 m_flBlendTimeSeconds;
};
