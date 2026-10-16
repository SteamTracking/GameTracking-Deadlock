// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_CloudburstVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ZapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ProjectileArmedModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	CSoundEventName m_strProjectileLoopingSound;
	CSoundEventName m_strExplosionSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flArmingSpeed; // = 50
	float32 m_flNonArmingSpeed; // = 100
};
