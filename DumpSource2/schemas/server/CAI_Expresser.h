// MGetKV3ClassDefaults = {
//	"_class": "CAI_Expresser",
//	"m_conceptCooldowns":
//	{
//	},
//	"m_ruleCooldowns":
//	{
//	},
//	"m_flStopTalkTime": null,
//	"m_flStopTalkTimeWithoutDelay": null,
//	"m_flQueuedSpeechTime": null,
//	"m_flBlockedTalkTime": null,
//	"m_voicePitch": 100,
//	"m_flLastTimeAcceptedSpeak": null,
//	"m_bAllowSpeakingInterrupts": false,
//	"m_bConsiderSceneInvolvementAsSpeech": false,
//	"m_bSceneEntityDisabled": false,
//	"m_nLastSpokenPriority": 0
//}
// MHasKV3TransferPolymorphicClassname
class CAI_Expresser
{
	CUtlDict< GameTime_t > m_conceptCooldowns;
	CUtlDict< GameTime_t > m_ruleCooldowns;
	GameTime_t m_flStopTalkTime;
	GameTime_t m_flStopTalkTimeWithoutDelay;
	GameTime_t m_flQueuedSpeechTime;
	GameTime_t m_flBlockedTalkTime;
	int32 m_voicePitch;
	GameTime_t m_flLastTimeAcceptedSpeak;
	bool m_bAllowSpeakingInterrupts;
	bool m_bConsiderSceneInvolvementAsSpeech;
	bool m_bSceneEntityDisabled;
	int32 m_nLastSpokenPriority;
	// MNotSaved
	CBaseModelEntity* m_pOuter;
};
