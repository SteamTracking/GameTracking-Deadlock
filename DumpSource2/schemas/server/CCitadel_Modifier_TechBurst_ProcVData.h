// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_TechBurst_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	bool m_bIgnoreResists;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strUnchargedProc;
	CSoundEventName m_strFullChargedProc;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_ProcNotificationModifier;
};
