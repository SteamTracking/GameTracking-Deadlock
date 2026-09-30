// MHasKV3TransferPolymorphicClassname
class CItemHauntingScreamVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
};
