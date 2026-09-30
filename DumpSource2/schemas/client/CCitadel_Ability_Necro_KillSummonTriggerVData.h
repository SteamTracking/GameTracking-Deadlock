// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_KillSummonTriggerVData : public CBaseTriggerAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
