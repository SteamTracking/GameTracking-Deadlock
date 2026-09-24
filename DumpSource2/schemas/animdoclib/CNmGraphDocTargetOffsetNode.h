// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocTargetOffsetNode",
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
//			"m_name": "Result",
//			"m_type": "Target",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_bIsBoneSpaceOffset": true,
//	"m_rotationOffset":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_translationOffset":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocTargetOffsetNode : public CNmGraphDocFlowNode
{
	bool m_bIsBoneSpaceOffset;
	QAngle m_rotationOffset;
	Vector m_translationOffset;
};
