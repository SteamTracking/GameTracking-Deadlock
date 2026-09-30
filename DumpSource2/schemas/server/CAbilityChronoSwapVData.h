// MHasKV3TransferPolymorphicClassname
class CAbilityChronoSwapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MultiSwapEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BubbleMoveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ShieldModifier;
};
