// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SuperAcolytesGlove_VData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FistReadyEffect;
};
