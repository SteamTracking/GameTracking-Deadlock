// MHasKV3TransferPolymorphicClassname
class CDestructableBuildingVData : public CEntitySubclassVDataBase
{
	float32 m_flEnemyTrooperProtectionRange; // = 1575
	float32 m_flTrooperJumpRange; // = 800
	float32 m_flFinishedDyingThink; // = 5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sAmberModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sSapphModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberDeathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphDeathParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AmberDeathSound;
	CSoundEventName m_SapphDeathSound;
	// MPropertyStartGroup = "GamePlay"
	int32 m_iMaxHealthFinal; // = 13000
	int32 m_iMaxHealthGenerator; // = 5000
	int32 m_iMaxHealthGeneratorSecond; // = 10000
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PowerGenerator;
	CEmbeddedSubclass< CCitadelModifier > m_ObjectiveRegen;
	CEmbeddedSubclass< CCitadelModifier > m_BackdoorBulletResistModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BackdoorProtectionModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RangedArmorModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BarrackBossProtection;
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_vecIntrinsicModifiers;
};
