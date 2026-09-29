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
//	"m_sources":
//	[
//	],
//	"m_impulseResponseValues":
//	[
//	],
//	"m_nNameHashCode": 0
//}
class CVMixDescription : public CVMixBaseGraphDescription
{
	// MKV3TransferName = "m_Submixes"
	CUtlLeanVector< CSubmix > m_submixList;
	CUtlLeanVector< std::unique_ptr< CVoiceContainerBase > > m_sources;
	CUtlLeanVector< uint64 > m_impulseResponseValues;
	uint32 m_nNameHashCode;
};
