// MGetKV3ClassDefaults = {
//	"m_when":
//	{
//		"m_vecEntityClasses":
//		[
//		],
//		"m_eAllegiance": "k_ePingTargetAllegiance_Any",
//		"m_eSourceContext": "k_ePingSourceContext_Any",
//		"m_eUltimateReady": "k_ePingTristate_Any",
//		"m_eUltimateTrained": "k_ePingTristate_Any",
//		"m_eSubjectAlive": "k_ePingTristate_Any",
//		"m_eSubjectVisible": "k_ePingTristate_Any"
//	},
//	"m_eConcept": "CITADEL_PING_CONCEPT_NONE"
//}
class PingDefaultOverride_t
{
	// MPropertyDescription = "What has to be true. Leave empty and this override always wins, which is only useful as the last entry in a list."
	PingConditions_t m_when;
	// MPropertyDescription = "What a tap says when it is."
	CitadelPingWheelConcept_t m_eConcept;
};
