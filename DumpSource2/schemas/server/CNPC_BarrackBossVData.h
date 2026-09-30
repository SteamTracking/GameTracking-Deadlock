// MHasKV3TransferPolymorphicClassname
class CNPC_BarrackBossVData : public CAI_CitadelNPCVData
{
	float32 m_flPlayerAutoAttackRange; // = 1000
	float32 m_flMinMeleeAttackTime; // = 1.5
	float32 m_flMeleeDuration; // = 1.5
	float32 m_flInvulRange;
	float32 m_flTrooperDamageResistPct;
	float32 m_flPlayerDamageResistPct;
	float32 m_flBackDoorProtectionRange; // = 2000
	// MPropertyStartGroup = "Death"
	float32 m_flDeathFadeTimeStart; // = 8
	float32 m_flDeathFadeTimeEnd; // = 10
	// MPropertyStartGroup = "Collision"
	float32 m_flTier1PlayerClipCapsuleRadius; // = 32
	float32 m_flTier1PlayerClipCapsuleHeight; // = 224
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sAngryStart;
	CSoundEventName m_sAngryLoop;
	CSoundEventName m_sAngryStop;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BackdoorProtectionModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TrooperBossInvulnModifier;
	// MPropertyStartGroup = "DPS"
	// MPropertyDescription = "Vs Trooper DPS"
	float32 m_flTrooperDPS;
	// MPropertyDescription = "Vs Player DPS"
	float32 m_flPlayerDPS;
	float32 m_flDPSPctGrowthPerMinute;
	float32 m_flEnemyTrooperProtectionRange; // = 1575
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BackdoorBulletResistModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ObjectiveRegen;
};
