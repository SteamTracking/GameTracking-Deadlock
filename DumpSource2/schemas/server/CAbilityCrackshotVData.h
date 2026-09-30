// MHasKV3TransferPolymorphicClassname
class CAbilityCrackshotVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionVictimParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ReadyParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CrackshotImmuneModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletResistModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_HeadShotVictimSound;
	CSoundEventName m_HeadShotConfirmationSound;
	CSoundEventName m_ReadySound;
};
