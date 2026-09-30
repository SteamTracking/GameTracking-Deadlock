// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tier2Boss_LaserBeamVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LaserLeft;
	CEmbeddedSubclass< CCitadelModifier > m_LaserMid;
	CEmbeddedSubclass< CCitadelModifier > m_LaserRight;
	CEmbeddedSubclass< CCitadelModifier > m_LaserCharge;
};
