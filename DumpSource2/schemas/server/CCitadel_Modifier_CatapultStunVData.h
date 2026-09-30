// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CatapultStunVData : public CModifierKnockdownVData
{
	float32 m_flStunDurationOnLand; // = 0.2
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
};
