// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_FearVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProcSound;
};
