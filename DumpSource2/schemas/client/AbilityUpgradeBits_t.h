enum AbilityUpgradeBits_t : uint16_t
{
	// MPropertySuppressEnumerator
	// MEnumeratorIsNotAFlag
	INVALID_ABILITY_UPGRADE_BITS = -1,
	ABILITY_UPGRADE_BIT_NOT_TRAINED = 0,
	ABILITY_UPGRADE_BIT_TRAINED = 1,
	ABILITY_UPGRADE_BIT_TIER_1 = 2,
	ABILITY_UPGRADE_BIT_TIER_2 = 4,
	ABILITY_UPGRADE_BIT_TIER_3 = 8,
	ABILITY_UPGRADE_BIT_4 = 16,
	ABILITY_UPGRADE_BIT_CORRUPTED = 128,
	// MPropertySuppressEnumerator
	// MEnumeratorIsNotAFlag
	ABILITY_UPGRADE_BIT_FULLY_UPGRADED = 15,
	// MPropertySuppressEnumerator
	// MEnumeratorIsNotAFlag
	ABILITY_UPGRADE_BIT_CAN_DOWNGRADE = 14,
	// MPropertySuppressEnumerator
	// MEnumeratorIsNotAFlag
	ABILITY_UPGRADE_ALL_BITS = 32767,
};
