class PingSlotOverride_t
{
	// MPropertyDescription = "What has to be true. Leave empty and this override always wins, which is only useful as the last entry in a list."
	PingConditions_t m_when; // = { "m_eAllegiance": "k_ePingTargetAllegiance_Any", "m_eSourceContext": "k_ePingSourceContext_Any", "m_eSubjectAlive": "k_ePingTristate_Any", "m_eSubjectVisible": "k_ePingTristate_Any", "m_eUltimateReady": "k_ePingTristate_Any", "m_eUltimateTrained": "k_ePingTristate_Any", "m_vecEntityClasses": [  ] }
	// MPropertyDescription = "What to say when it is."
	PingSlotOption_t m_Option; // = { "m_eAbilityPingSlot": "ESlot_Invalid", "m_eMinimapPingAnim": "k_eMinimapPingAnim_Default", "m_ePingConcept": "CITADEL_PING_CONCEPT_NONE" }
	// MPropertyDescription = "Instead of saying something else, say nothing. The segment still draws so nothing shifts, but it reads as a gap and places a plain marker."
	bool m_bDisabled;
};
