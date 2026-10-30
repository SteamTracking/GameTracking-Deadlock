// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Attack_LobBookVData : public CCitadel_Neutral_Attack_BulletToPointModifierVData
{
	float32 m_flDamage; // = 20
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AutoShotCounterModifier;
};
