// MGetKV3ClassDefaults = {
//	"_class": "CVoiceContainerLoopTrigger",
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
//	"m_flRetriggerTimeMin": 1.000000,
//	"m_flRetriggerTimeMax": 1.000000,
//	"m_flFadeTime": 0.500000,
//	"m_bCrossFade": false,
//	"m_sound":
//	{
//		"m_namespace": "",
//		"m_bUseReference": true,
//		"m_sound": "",
//		"m_pSound": null
//	}
//}
// MPropertyFriendlyName = "LoopTrigger"
// MPropertyDescription = "Continuously retriggers a sound and optionally fades to the new instance."
// MHasKV3TransferPolymorphicClassname
class CVoiceContainerLoopTrigger : public CVoiceContainerBase
{
	float32 m_flRetriggerTimeMin;
	float32 m_flRetriggerTimeMax;
	float32 m_flFadeTime;
	bool m_bCrossFade;
	// MPropertyFriendlyName = "Vsnd Reference"
	CSoundContainerReference m_sound;
};
