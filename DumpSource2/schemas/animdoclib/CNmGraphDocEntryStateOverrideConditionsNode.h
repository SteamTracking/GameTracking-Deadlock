// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocEntryStateOverrideConditionsNode",
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
//	],
//	"m_resultType": "Special",
//	"m_pinToStateMapping":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocEntryStateOverrideConditionsNode : public CNmGraphDocResultNode
{
	// MPropertySuppressField
	CUtlVector< V_uuid_t > m_pinToStateMapping;
};
