// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_HomingProjectileVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StackingBuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	CSoundEventName m_strInkShootSound;
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strAG2ProjectileFlightHeroState;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDebug;
	bool m_bGrantAmmoOnCast; // = true
	bool m_bDealDamageOnStrokeDestroy; // = true
	float32 m_flHomingRange; // = 200
	float32 m_flHomingStrength; // = 5000
	float32 m_flRandomUpVelocity; // = 100
	float32 m_flRandomLeftVelocity; // = 100
	float32 m_flSpringStrength; // = 100
	float32 m_flDampingStrength; // = 2
};
