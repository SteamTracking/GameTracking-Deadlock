// MVDataRoot
// MVDataAssociatedFile = "scripts/accolades.vdata"
class CAccoladeDefinition
{
	// MVDataUniqueMonotonicInt = "_editor/next_accolade_id"
	// MPropertyAttributeEditor = "locked_int()"
	AccoladeID_t m_unAccoladeID;
	CUtlString m_sTrackedStatName;
	CVDataLocalizedToken m_sFlavorName;
	CVDataLocalizedToken m_sDescription;
	EAccoladeThresholdType m_eThresholdType; // = "Manual"
	CUtlVector< TrackedStatValue_t > m_vecThresholds;
	CUtlVector< ECitadelGameMode > m_vecEnabledGameModes;
};
