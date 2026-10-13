// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_DeadpackPrimaryWeaponChargeVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Charged Weapons"
	float32 m_flExplosionRadiusInnerFraction; // = 0.2
	float32 m_flExplosionDamageScaleAtMaxRadius; // = 0.75
	// MPropertyStartGroup = "Rocket Jump"
	float32 m_flRocketJumpExtraRadiusMeters; // = 1
	float32 m_flRocketJumpForceMin;
	float32 m_flRocketJumpForceMax;
	float32 m_flRocketJumpForceUpBias;
	float32 m_flRocketJumpForceCrouchMultiplier; // = 1
	float32 m_flRocketJumpForceWallMultiplier; // = 1
	float32 m_flRocketJumpWallJumpWindow; // = 0.5
	float32 m_flRocketJumpAlreadyFasterMultiplier; // = 0.9
	float32 m_flRocketJumpSelfDamageMaxHealthPercent;
	CEmbeddedSubclass< CCitadelModifier > m_RocketJumpModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargingAmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeBeginParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeLevel2Particle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeLevel2AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactExplosionChargeLevel2;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strChargeLevel2Sound;
	CSoundEventName m_strChargingSound;
	CSoundEventName m_strChargeLevel2LoopSound;
	CSoundEventName m_strShootDefaultSound;
	CSoundEventName m_strShootLevel2Sound;
	CSoundEventName m_strImpactDefaultSound;
	CSoundEventName m_strImpactLevel2Sound;
	CSoundEventName m_strLevel2HitConfirmSound;
	CSoundEventName m_strLevel2HitConfirmNPCSound;
};
