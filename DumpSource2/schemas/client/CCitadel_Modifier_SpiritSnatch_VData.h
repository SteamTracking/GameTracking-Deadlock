// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SpiritSnatch_VData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BuffModifier;
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
};
