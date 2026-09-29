// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocBoneMaskNode",
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
//	],
//	"m_outputPins":
//	[
//		{
//			"m_ID": "",
//			"m_name": "Bone Mask",
//			"m_type": "BoneMask",
//			"m_bIsDynamicPin": false,
//			"m_bAllowMultipleOutConnections": true
//		}
//	],
//	"m_pDefaultVariationData":
//	{
//		"_class": "CNmGraphDocBoneMaskNode::CData",
//		"m_overrideMaskID": ""
//	},
//	"m_overrides":
//	[
//	],
//	"m_defaultResourceName": "",
//	"m_maskID": "",
//	"m_bIsOptionalMask": false
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocBoneMaskNode : public CNmGraphDocVariationDataNode
{
	// MPropertyAttributeEditor = "BoneMaskID()"
	CGlobalSymbol m_maskID;
	// MPropertyDescription = "Should we check at compile time that this is an optional mask?"
	bool m_bIsOptionalMask;
};
