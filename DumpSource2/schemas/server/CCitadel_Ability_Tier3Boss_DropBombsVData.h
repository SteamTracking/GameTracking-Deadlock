// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tier3Boss_DropBombsVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberAoeWarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberAoeWarningGroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphAoeWarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphAoeWarningGroundParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AmberAOEWarningSound;
	CSoundEventName m_AmberAOEImpactSound;
	CSoundEventName m_SapphireAOEWarningSound;
	CSoundEventName m_SapphireAOEImpactSound;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLaunchSound;
	CSoundEventName m_strLandSound;
	CSoundEventName m_strExplodeSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CurseModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flExplodeRadius; // = 200
	float32 m_flBombOffsets; // = 170
	float32 m_flBaseDamage; // = 300
	float32 m_flDamageNonPlayer; // = 450
	float32 m_flMaxHealthPctDamage; // = 0.3
	float32 m_flDebuffDuration; // = 3
	float32 m_flCooldownMax; // = 6
	float32 m_flCooldownMin; // = 1
	float32 m_flDetonationTimeMax; // = 3
	float32 m_flDetonationTimeMin; // = 1
	float32 m_flBossHealthMax; // = 0.8
	float32 m_flBossHealthMin; // = 0.2
	float32 m_flBombDropDist; // = 300
	float32 m_flWarningOffset; // = 64
};
