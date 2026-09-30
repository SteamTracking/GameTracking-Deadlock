// MHasKV3TransferPolymorphicClassname
class CCitadelModifierAuraVData : public CModifierVData_BaseAura
{
	CITADEL_UNIT_TARGET_TYPE m_iAuraSearchType;
	CITADEL_UNIT_TARGET_FLAGS m_iAuraSearchFlags;
	ELOSCheck m_eLosCheck; // = "None"
	float32 m_flModifierProvidedByAuraDuration; // = -1
	bool m_bRemoveProvidedModifierOnAuraRemoval;
};
