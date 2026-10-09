enum EStatsType : uint32_t
{
	EWeaponDPS = 0,
	EMeleeDamage_DEPRECATED = 1,
	// MStatValueCacheEnabled
	EMaxHealth = 2,
	// MStatValueCacheEnabled
	EClipSize = 3,
	// MStatValueCacheEnabled
	EBaseHealthRegen = 4,
	// MStatValueCacheEnabled
	EExternalHealthRegen = 5,
	// MStatValueCacheEnabled
	EHealthRegen = 6,
	// MStatValueCacheEnabled
	EMaxMoveSpeed = 7,
	// MStatValueCacheEnabled_IgnoreParams
	ESprintSpeed = 8,
	ECrouchSpeed = 9,
	// MStatValueCacheEnabled_IgnoreParams
	EMoveAcceleration = 10,
	EClipSizeIncrease = 11,
	EBulletArmorDamageReduction = 12,
	EBulletShieldHealth = 13,
	ETechArmorDamageReduction = 14,
	ETechShieldHealth_DEPRECATED = 15,
	ELightMeleeDamage = 16,
	EHeavyMeleeDamage = 17,
	EWeaponRange = 18,
	EWeaponRecoilReduction = 19,
	// MStatValueCacheEnabled
	EFireRate = 20,
	EWeaponPower = 21,
	EWeaponPowerScale = 22,
	EBulletDamage = 23,
	ETechPowerAmp_DEPRECATED = 24,
	ETechPowerAmpBonus_DEPRECATED = 25,
	ERoundsPerSecond = 26,
	ERoundsPerSecondInverse = 27,
	EBaseWeaponDamageIncrease = 28,
	EBaseMeleeDamageIncrease = 29,
	EAirJumpCount = 30,
	EProcBuildUpRateScale = 31,
	// MStatValueCachePerAbility_IgnoreParams
	ETechCooldown = 32,
	ETechCooldownBetweenChargeUses = 33,
	ETechRange = 34,
	ETechRadius = 35,
	EProjectileRadius_DEPRECATED = 36,
	EMeleeRange = 37,
	EReloadSpeed = 38,
	// MStatValueCachePerAbility_IgnoreParams
	EMaxChargesIncrease = 39,
	EHealingOutput = 40,
	ETechDuration = 41,
	EWeaponSpreadScale = 42,
	EMeleeScalingFromWeaponPower_DEPRECATED = 43,
	EHealthAttribute_DEPRECATED = 44,
	EArmorAttribute_DEPRECATED = 45,
	EFireRateAttribute_DEPRECATED = 46,
	EWeaponPowerAttribute_DEPRECATED = 47,
	ETechDamageAttribute_DEPRECATED = 48,
	EReloadTime = 49,
	// MStatValueCacheEnabled
	EStamina = 50,
	EStaminaCooldown_DEPRECATED = 51,
	EBuildUpRate = 52,
	EBaseWeaponDamagePerShot = 53,
	ETechLifesteal = 54,
	ETechLifestealNonHero_DEPRECATED = 55,
	EBulletLifesteal = 56,
	// MStatValueCacheEnabled
	EDamageScale = 57,
	EChannelDuration = 58,
	// MStatValueCachePerAbility
	ETechPower = 59,
	// MStatValueCacheEnabled_IgnoreParams
	EArmorPower = 60,
	// MStatValueCacheEnabled
	ETechDamageScale = 61,
	// MStatValueCacheEnabled
	EWeaponDamageScale = 62,
	// MStatValueCacheEnabled
	EMeleeDamageScale = 63,
	// MStatValueCacheEnabled
	ELevelUpBaseWeaponDamageIncrease = 64,
	// MStatValueCacheEnabled
	ELevelUpBaseMeleeDamageIncrease = 65,
	// MStatValueCacheEnabled
	ELevelUpBaseHealthIncrease = 66,
	// MStatValueCacheEnabled
	EStaminaRegenPerSecond = 67,
	// MStatValueCachePerAbility_IgnoreParams
	EAbilityResourceMax = 68,
	// MStatValueCachePerAbility_IgnoreParams
	EAbilityResourceRegenPerSecond = 69,
	ECycleTime = 70,
	EMeleeTravelDistanceScale = 71,
	EAirMoveDistanceScale = 72,
	ECritDamageReceivedScale = 73,
	EWeaponFalloffMinRange = 74,
	EWeaponFalloffMaxRange = 75,
	EBulletSpeed = 76,
	EBulletSpeedIncrease = 77,
	EStaminaRegenIncrease = 78,
	EStaminaCooldown = 79,
	EDebuffResist = 80,
	ECritDamageBonusScale = 81,
	EMeleeResist = 82,
	ELevelUpBoons = 83,
	// MStatValueCacheEnabled_IgnoreParams
	EParryCooldown = 84,
	EHeroBulletLifestealEffectiveness = 85,
	EHeroSpiritLifestealEffectiveness = 86,
	// MStatValueCacheEnabled_IgnoreParams
	EOOCHealthRegen = 87,
	ESlowResistance = 88,
	EStaminaRegenPercent = 89,
	// MStatValueCachePerAbility_IgnoreParams
	EItemCooldown = 90,
	EGroundDashDistanceInMeters = 91,
	EGroundDashDuration = 92,
	EAirDashDistanceInMeters = 93,
	EAirDashDuration = 94,
	EDashSpeedInMeters = 95,
	// MStatValueCachePerAbility_IgnoreParams
	EEnableAbilityCharges = 96,
	// MStatValueCachePerAbility
	EAbilityLevel = 97,
	EIntraBurstCycleTime = 98,
	EBurstShotCount = 99,
	// MStatValueCacheEnabled_IgnoreParams
	EHealingAmp = 100,
	EWeaponCritChance = 101,
	// MStatValueCacheEnabled_IgnoreParams
	ECurrentHealth = 102,
	// MStatValueCacheEnabled_IgnoreParams
	EMovementTimeScale = 103,
	// MStatValueCacheEnabled_IgnoreParams
	EGameplayTimeScale = 104,
	// MStatValueCacheEnabled_IgnoreParams
	EAnimationTimeScale = 105,
	// MStatValueCacheEnabled_IgnoreParams
	EParticleTimeScale = 106,
	// MStatValueCacheEnabled_IgnoreParams
	ETechPowerStolen = 107,
	EStatsCount = 108,
	EStatsInvalid = 108,
};
