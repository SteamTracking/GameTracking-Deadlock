// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_MoveChargeVData : public CModifierNeutralAbilityVData
{
	float32 m_flChargeSpeedm; // = 15
	float32 m_flLookAheadFrames; // = 2
	float32 m_flStunTime; // = 1
	float32 m_flDamage; // = 100
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAttackEndSound;
	CSoundEventName m_strAttackHitSound;
};
