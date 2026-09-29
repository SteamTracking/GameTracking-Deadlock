// MGetKV3ClassDefaults = {
//	"Name": "",
//	"m_nGraphOutputChannels": -1,
//	"m_bIsMainGraph": false,
//	"m_Processors":
//	[
//	],
//	"m_graphInputs":
//	[
//	],
//	"m_controlTransientInputs":
//	[
//	],
//	"m_controlOutputs":
//	[
//	],
//	"m_impulseResponseInputs":
//	[
//	],
//	"m_MixCommands":
//	[
//	],
//	"m_heap":
//	{
//		"m_storage":
//		[
//		]
//	},
//	"m_audioMeters":
//	[
//	],
//	"m_controlMeters":
//	[
//	],
//	"m_nameInputMeters":
//	[
//	],
//	"m_additionalOutputs":
//	[
//	],
//	"m_automaticControlInputs":
//	[
//	],
//	"m_Submixes":
//	[
//	],
//	"m_impulseResponseValues":
//	[
//	],
//	"m_inputDefaultValues": null,
//	"m_sources": null,
//	"m_fixups":
//	[
//	]
//}
class CVMixRuntimeGraph : public CVMixBaseGraphDescription
{
	// MKV3TransferName = "m_Submixes"
	CUtlLeanVector< CVMixSubmix > m_submixes;
	CUtlLeanVector< uint64 > m_impulseResponseValues;
	KeyValues3 m_inputDefaultValues;
	KeyValues3 m_sources;
	CUtlVector< VMixPointerFixupEntry_t > m_fixups;
};
