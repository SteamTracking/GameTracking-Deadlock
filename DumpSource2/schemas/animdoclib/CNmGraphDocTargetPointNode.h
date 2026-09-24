// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocTargetPointNode",
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
//			"m_name": "Target",
//			"m_type": "Target",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": false
//		}
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Point",
//			"m_type": "Vector",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_bIsWorldSpaceTarget": true
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocTargetPointNode : public CNmGraphDocFlowNode
{
	bool m_bIsWorldSpaceTarget;
};
