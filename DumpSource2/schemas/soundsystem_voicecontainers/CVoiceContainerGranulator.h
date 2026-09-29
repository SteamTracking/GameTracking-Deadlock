// MGetKV3ClassDefaults = {
//	"_class": "CVoiceContainerGranulator",
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
//	"m_flGrainLength": 0.100000,
//	"m_flGrainCrossfadeAmount": 0.100000,
//	"m_flStartJitter": 0.000000,
//	"m_flPlaybackJitter": 0.000000,
//	"m_bShouldWraparound": false,
//	"m_sourceAudio": "",
//	"m_bDoubleBufferSourceAudio": false,
//	"m_flMaxSourceLength": 0.000000
//}
// MPropertyFriendlyName = "Granulator Container"
// MHasKV3TransferPolymorphicClassname
class CVoiceContainerGranulator : public CVoiceContainerAsyncGenerator
{
	float32 m_flGrainLength;
	float32 m_flGrainCrossfadeAmount;
	float32 m_flStartJitter;
	float32 m_flPlaybackJitter;
	bool m_bShouldWraparound;
	CStrongHandle< InfoForResourceTypeCVoiceContainerBase > m_sourceAudio;
	// MPropertyFriendlyName = "Double Buffer Source Audio"
	bool m_bDoubleBufferSourceAudio;
	// MPropertyFriendlyName = "Max Source Length (seconds)"
	float32 m_flMaxSourceLength;
};
