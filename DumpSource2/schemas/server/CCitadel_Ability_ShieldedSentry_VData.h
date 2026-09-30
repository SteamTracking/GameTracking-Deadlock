// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ShieldedSentry_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_InnateModifier;
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flDamageFalloffEndScale; // = 0.65
};
