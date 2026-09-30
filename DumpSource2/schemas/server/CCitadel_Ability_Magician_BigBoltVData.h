// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Magician_BigBoltVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShootDelayParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BoltHitModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBoltDelay;
	CSoundEventName m_strBoltFire;
};
