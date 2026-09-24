// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocVariationIDComparisonNode",
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
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Result",
//			"m_type": "Bool",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_pDefaultVariationData":
//	{
//		"_class": "CNmGraphDocVariationIDComparisonNode::CData",
//		"m_values":
//		[
//			""
//		]
//	},
//	"m_overrides":
//	[
//	],
//	"m_defaultResourceName": "",
//	"m_comparison": "Matches"
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocVariationIDComparisonNode : public CNmGraphDocVariationDataNode
{
	CNmIDComparisonNode::Comparison_t m_comparison;
};
