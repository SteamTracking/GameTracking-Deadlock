// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocCachedVectorNode",
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
//			"m_name": "Value",
//			"m_type": "Vector",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Result",
//			"m_type": "Vector",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_mode": "OnEntry"
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocCachedVectorNode : public CNmGraphDocFlowNode
{
	NmCachedValueMode_t m_mode;
};
