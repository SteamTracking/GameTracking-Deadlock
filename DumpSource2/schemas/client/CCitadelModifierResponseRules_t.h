class CCitadelModifierResponseRules_t
{
	CitadelConcept_t m_nConcept; // = "CITADEL_CONCEPT_NONE"
	CUtlOrderedMap< CUtlString, CUtlString > m_Criteria;
	CCitadelModifierResponseRulesFilterType_t m_nFilterType; // = "MODIFIER_RR_FILTER_BROADCAST"
	CCitadelModifierSpeaker_t m_nSpeakerType; // = "MODIFIER_RR_SPEAKER_PARENT"
};
