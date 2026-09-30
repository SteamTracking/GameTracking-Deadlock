// MHasKV3TransferPolymorphicClassname
class CModifierT2BossWaveTargetVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strSilenceTargetSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisarmModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletResistModifier;
	// MPropertyGroupName = "Gameplay"
	float32 m_flTossUpStrength;
	float32 m_flTossHorizontalMax;
	float32 m_flTossHorizontalMin;
	float32 m_flDebuffDuration;
};
