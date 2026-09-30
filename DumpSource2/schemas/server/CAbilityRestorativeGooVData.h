// MHasKV3TransferPolymorphicClassname
class CAbilityRestorativeGooVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RestorativeGooParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RestorativeGooSelfParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RestorativeGooModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SelfCubeModelSwapModifier;
};
