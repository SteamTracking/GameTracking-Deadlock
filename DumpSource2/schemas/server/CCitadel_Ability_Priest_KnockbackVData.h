// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_KnockbackVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KnockbackToWallModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KnockbackModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShootParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InitialImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strShootSound;
	// MPropertyStartGroup = "GamePlay"
	bool m_bDoWallSlamBehavior; // = true
	float32 m_flMinTravelTime; // = 0.1
	float32 m_flTravelTimeFudge; // = 0.1
	int32 m_iFakeBulletCount; // = 5
	float32 m_flFakeBulletSpread; // = 0.5
	float32 m_flFakeBulletDistanceFudge; // = 10
	float32 m_flDotProductToStun; // = -0.5
};
