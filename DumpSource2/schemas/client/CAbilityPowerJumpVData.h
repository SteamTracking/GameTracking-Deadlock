// MHasKV3TransferPolymorphicClassname
class CAbilityPowerJumpVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JumpParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InAirModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PowerJumpModifier;
};
