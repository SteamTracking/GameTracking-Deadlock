// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Necro_Ghoul_ExplodeVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WarningParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	CSoundEventName m_WarningSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
};
