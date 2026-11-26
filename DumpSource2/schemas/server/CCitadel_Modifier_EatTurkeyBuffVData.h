// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_EatTurkeyBuffVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Overstuffed"
	// MPropertyDescription = "Penalty applied every time another turkey is collected while this buff is still up."
	CEmbeddedSubclass< CCitadelModifier > m_OverstuffedModifier;
	// MPropertyDescription = "Seconds the Overstuffed modifier lasts."
	float32 m_flOverstuffedDuration; // = 10
	// MPropertyStartGroup = "Turkey"
	// MPropertyDescription = "Health regenerated in total over the buff's duration."
	float32 m_flTotalHealthRegen; // = 90
	// MPropertyDescription = "Added to Total Health Regen for every minute of match time when the turkey is collected."
	float32 m_flTotalHealthRegenPerMinute; // = 4
	// MPropertyDescription = "Stamina restored each time a turkey is collected."
	float32 m_flStaminaOnPickup; // = 2
};
