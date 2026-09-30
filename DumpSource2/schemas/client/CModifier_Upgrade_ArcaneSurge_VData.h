// MHasKV3TransferPolymorphicClassname
class CModifier_Upgrade_ArcaneSurge_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SurgeWindowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AbilityWatcherModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMaxSurgeTime; // = 25
};
