// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Baba_Ult2_Impact_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Hex"
	CEmbeddedSubclass< CCitadelModifier > m_HexModifier;
	CSoundEventName m_strHexSound;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
};
