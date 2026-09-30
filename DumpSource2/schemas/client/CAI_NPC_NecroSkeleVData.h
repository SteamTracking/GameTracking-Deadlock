// MHasKV3TransferPolymorphicClassname
class CAI_NPC_NecroSkeleVData : public CAI_CitadelNPCVData
{
	float32 m_flMeleeDuration; // = 1
	float32 m_flMeleeFireDelay; // = 0.1
	float32 m_flNonPlayerDamageResist; // = 0.5
	CEmbeddedSubclass< CCitadelModifier > m_ExplodeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamageSlowModifier;
	float32 m_flHeroLockRange; // = 400
	float32 m_flHeroLockBreakRange; // = 1000
	CUtlVector< NecroSkeleTargetTier_t > m_vecTargettingTiers;
};
