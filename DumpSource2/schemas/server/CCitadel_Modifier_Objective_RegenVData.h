// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Objective_RegenVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Objective Health Regen"
	// MPropertyDescription = "How health per second when out of combat?"
	float32 m_flOutOfCombatHealthRegen;
	// MPropertyDescription = "How longer after taking no damage will out out of combat regen kick in?"
	float32 m_flOutOfCombatRegenDelay;
};
