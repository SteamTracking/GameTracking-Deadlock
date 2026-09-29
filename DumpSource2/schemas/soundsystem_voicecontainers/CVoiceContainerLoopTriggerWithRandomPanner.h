// MGetKV3ClassDefaults = {
//	"_class": "CVoiceContainerLoopTriggerWithRandomPanner",
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
//	},
//	"m_randomPannerControls":
//	{
//		"m_panningControlInputName": "random_pan",
//		"m_volumeControlInputName": "random_volume",
//		"m_flMinVolume": -12.000000,
//		"m_flMaxVolume": 0.000000,
//		"m_strVectorStackParam": "ListenerForwardVector"
//	}
//}
// MPropertyFriendlyName = "LoopTriggerWithRandomPanner"
// MPropertyDescription = "Continuously retriggers a sound and optionally fades to the new instance. Sends a new Random panning value to a control input on each retrigger"
// MHasKV3TransferPolymorphicClassname
class CVoiceContainerLoopTriggerWithRandomPanner : public CVoiceContainerLoopTrigger
{
	// MPropertyFriendlyName = "Random Panner Control"
	CRandomPannerControls m_randomPannerControls;
};
