// MHasKV3TransferPolymorphicClassname
class CItemAOESilenceModifierVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strSilenceTargetSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
};
