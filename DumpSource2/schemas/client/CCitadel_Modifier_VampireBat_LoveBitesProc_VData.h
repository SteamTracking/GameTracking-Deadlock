// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_VampireBat_LoveBitesProc_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProcHitSound;
};
