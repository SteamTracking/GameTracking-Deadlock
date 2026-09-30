// MHasKV3TransferPolymorphicClassname
class CModifier_Wrecker_UltimateVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyGrabModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyThrowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDamageModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InvincibleModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_StartSound;
	CSoundEventName m_AmbientLoopingSound;
	CSoundEventName m_GrabSound;
	CSoundEventName m_ThrowSound;
};
