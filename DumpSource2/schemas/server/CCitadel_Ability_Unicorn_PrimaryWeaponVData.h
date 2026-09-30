// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Unicorn_PrimaryWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visual"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BatonFlameParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBounceSound;
	CSoundEventName m_strFiringLoopSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTargetingRadius; // = 500
	float32 m_flUnitHitTargetingRadius; // = 500
	float32 m_flOrbHitTargetingRadius; // = 700
	ELOSCheck m_eLosCheckType; // = "Bounds"
	int32 m_nRicochetTargets; // = 1
	float32 m_flRicochetPitchAddition; // = -10
	float32 m_flOrbRicochetPitchAddition; // = -20
	float32 m_flRicochetGravity; // = 1.6
	float32 m_flOrbRicochetConeAngle; // = 90
	float32 m_flRicochetConeAngle; // = 45
	float32 m_flMaxRicohetDot; // = 0.5
	float32 m_flMinTargetDot; // = 0.7
	float32 m_flRicochetDamageScale; // = 0.8
	float32 m_flRearOffset; // = 10
	float32 m_flRicochetDotMaxDampening; // = 0.8
	float32 m_flRicochetDotMinDampening; // = 0.15
	float32 m_flMinVelocityDampening;
	float32 m_flMaxVelocityDampening; // = 0.5
	float32 m_flMinButtonHoldTimeToPlaySound; // = 0.1
};
