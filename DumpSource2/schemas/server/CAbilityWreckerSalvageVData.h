// MHasKV3TransferPolymorphicClassname
class CAbilityWreckerSalvageVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SalvageEnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StunEnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
