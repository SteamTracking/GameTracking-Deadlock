// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Nano_PredatoryStatueTargetVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLaserHitSound;
	CSoundEventName m_strLaserStartSound;
	CSoundEventName m_strLaserLoopSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
