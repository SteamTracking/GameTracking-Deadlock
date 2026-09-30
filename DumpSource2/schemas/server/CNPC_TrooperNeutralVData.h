// MHasKV3TransferPolymorphicClassname
class CNPC_TrooperNeutralVData : public CAI_CitadelNPCVData
{
	ENeutralNPCType m_eNeutralType; // = "NEUTRAL_NPC_NORMAL"
	float32 m_flGoldReward; // = 110
	float32 m_flGoldRewardBonusPercentPerMinute; // = 1.2
	int32 m_iMaxSquadAttackers; // = -1
	float32 m_flShieldReactivateDelay;
	float32 m_flDyingDuration; // = 0.01
	// MPropertyStartGroup = "Movement"
	float32 m_flReturnToSpawnSpeed; // = 400
	float32 m_flSpawnTetherRadius; // = 1000
	// MPropertyStartGroup = "Abilities"
	float32 m_flAbilityChance01;
	float32 m_flAbilityChance02;
	float32 m_flAbilityChance03;
	float32 m_flMinTimeBetweenAbilities; // = 4
	CSubclassName< 2 > m_sNeutralMelee;
	CUtlVector< CSubclassName< 2 > > m_vNeutralAbilities;
	// MPropertyStartGroup = "Behaviors"
	// MPropertyFriendlyName = "Damaged by Bullets?"
	bool m_bDamagedByBullets; // = true
	// MPropertyFriendlyName = "Damaged by Melee?"
	bool m_bDamagedByMelee; // = true
	// MPropertyFriendlyName = "Damaged by Abilities?"
	bool m_bDamagedByAbilities; // = true
	// MPropertyFriendlyName = "No Melee"
	// MPropertyDescription = "Never attempt the generic melee attack. Abilities still fire."
	bool m_bNoMelee;
	// MPropertyFriendlyName = "Only Melee"
	// MPropertyDescription = "Never fire the generic weapon. Melee and abilities still fire."
	bool m_bOnlyMelee;
	float32 m_flAttackRangeTarget; // = 500
	float32 m_flStrafeAngleAmount;
	float32 m_flStrafeSideDuration; // = 3
	float32 m_flNonMoveAttackDuration; // = 5
	float32 m_flRNGTickRate; // = 5
	float32 m_flWakeUpTime; // = 1
	// MPropertyStartGroup = "Animations"
	bool m_bUseSleepPoseWhenNoTarget; // = true
	// MPropertyStartGroup = "Shield FX"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldParticle;
	// MPropertyDescription = "Particle to play when dealing retaliate damage"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_retaliateParticle;
	// MPropertyStartGroup = "Body"
	CUtlVector< CUtlString > m_vecRandomBodyGroup;
	CUtlVector< CUtlString > m_vecRandomSkin;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_SpawnSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_NeutralDamageGrowth;
	CEmbeddedSubclass< CCitadelModifier > m_SleepModifier;
	// MPropertyStartGroup = "Health Bar"
	CUtlHashtable< int32, CUtlString > m_mapViewerSoulsClass;
};
