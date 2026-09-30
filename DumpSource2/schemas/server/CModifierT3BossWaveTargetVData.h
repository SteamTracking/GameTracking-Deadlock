// MHasKV3TransferPolymorphicClassname
class CModifierT3BossWaveTargetVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strSilenceTargetSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CurseModifier;
	// MPropertyGroupName = "Gameplay"
	float32 m_flTossUpStrength;
	float32 m_flTossHorizontalMax;
	float32 m_flTossHorizontalMin;
	float32 m_flDebuffDuration;
};
