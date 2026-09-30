// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_SelfCastModifierVData : public CModifierNeutralAbilityVData
{
	float32 m_flModifierDuration; // = 30
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfCastModifier;
};
