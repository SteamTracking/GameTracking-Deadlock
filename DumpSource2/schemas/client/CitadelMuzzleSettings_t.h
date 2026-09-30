// MModelGameData
// MPropertyFriendlyName = "Citadel Muzzle Settings"
class CitadelMuzzleSettings_t
{
	CUtlVector< CitadelMuzzle_t > m_vecPrimaryMuzzles;
	CUtlVector< CitadelMuzzle_t > m_vecSecondaryMuzzles;
	// MPropertyDescription = "When true, primary muzzles will be selected randomly instead of sequentially."
	bool m_bRandomizePrimaryMuzzleUsage;
	// MPropertyDescription = "When true, secondary muzzles will be selected randomly instead of sequentially."
	bool m_bRandomizeSecondaryMuzzleUsage;
	// MPropertyDescription = "How long between primary shots before resetting the next muzzle used to the first one"
	float32 m_flPrimaryMuzzleResetTime; // = 0.5
	// MPropertyDescription = "How long between secondary shots before resetting the next muzzle used to the first one"
	float32 m_flSecondaryMuzzleResetTime; // = 0.5
};
