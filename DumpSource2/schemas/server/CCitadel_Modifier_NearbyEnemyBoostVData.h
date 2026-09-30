// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NearbyEnemyBoostVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BerserkerSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
