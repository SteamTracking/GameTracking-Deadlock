// MHasKV3TransferPolymorphicClassname
class CAbilityKobunVData : public CitadelAbilityVData
{
	Vector m_vSummonFollowOffset;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CloneModifier;
};
