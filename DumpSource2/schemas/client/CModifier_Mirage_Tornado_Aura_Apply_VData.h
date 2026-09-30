// MHasKV3TransferPolymorphicClassname
class CModifier_Mirage_Tornado_Aura_Apply_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LiftModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
};
