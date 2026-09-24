// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocFloatAngleMathNode",
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
//			"m_name": "Angle (deg)",
//			"m_type": "Float",
//			"m_bIsDynamicPin": false,
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
//	"m_operation": "ClampTo180"
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocFloatAngleMathNode : public CNmGraphDocFlowNode
{
	CNmFloatAngleMathNode::Operation_t m_operation;
};
