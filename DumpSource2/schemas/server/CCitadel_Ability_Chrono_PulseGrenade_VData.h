// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chrono_PulseGrenade_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PulseAreaModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Misc"
	CUtlString m_strDebuffStatName;
};
