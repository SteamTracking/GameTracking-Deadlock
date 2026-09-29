// MGetKV3ClassDefaults = {
//	"_class": "CVoiceContainerVMixSnd",
//	"m_vSound":
//	{
//		"m_Sentences":
//		[
//		],
//		"m_nRate": 0,
//		"m_nFormat": "PCM16",
//		"m_nChannels": 0,
//		"m_nLoopStart": 0,
//		"m_nSampleCount": 0,
//		"m_flDuration": 0.000000,
//		"m_nStreamingSize": 0,
//		"m_nLoopEnd": 0
//	},
//	"m_pEnvelopeAnalyzer": null,
//	"m_resourceName": ""
//}
// MPropertyFriendlyName = "VMixSound"
// MPropertyDescription = "Plays a vmix graph and its containers."
// MHasKV3TransferPolymorphicClassname
class CVoiceContainerVMixSnd : public CVoiceContainerBase
{
	CUtlString m_resourceName;
};
