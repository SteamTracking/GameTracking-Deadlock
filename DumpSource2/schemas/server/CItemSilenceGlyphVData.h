// MHasKV3TransferPolymorphicClassname
class CItemSilenceGlyphVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ResistReductionModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
};
