// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BaseEventProcVData : public CCitadelModifierVData
{
	bool m_bProcChanceAffectedByEffectiveness;
	bool m_bShouldApplyAbilityCooldown;
	// MPropertySuppressExpr = "m_bCanProcMultipleTimesFromSameShot != true"
	bool m_bCanProcMultipleTimesOnOneTarget; // = true
	bool m_bCanProcByOtherObjects;
	bool m_bCanProcFromItems; // = true
	bool m_bProcOnFriendlyBulletHits;
	CITADEL_UNIT_TARGET_TYPE m_nAbilityTargetTypes;
	CITADEL_UNIT_TARGET_FLAGS m_nAbilityTargetFlags;
	CUtlVector< ECitadelDamageType > m_vecProcDamageTypes;
	TakeDamageFlags_t m_nRequiredDamageFlags;
	TakeDamageFlags_t m_nInvalidatingDamageFlags; // = "DFLAG_DO_NOT_PROC"
};
