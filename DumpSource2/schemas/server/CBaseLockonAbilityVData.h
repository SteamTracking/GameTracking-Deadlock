// MHasKV3TransferPolymorphicClassname
class CBaseLockonAbilityVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_TargetModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strApplyLockonStack;
	CSoundEventName m_strApplyMaxLockonStack;
};
