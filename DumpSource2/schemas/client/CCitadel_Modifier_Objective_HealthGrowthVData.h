// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Objective_HealthGrowthVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Objective Health Growth"
	// MPropertyDescription = "How much health per Minute"
	int32 m_iGrowthPerMinute; // = 250
	// MPropertyDescription = "How often do we update (seconds)"
	float32 m_flTickRate; // = 60
	int32 m_iGrowthStartTimeInMinutes; // = 20
};
