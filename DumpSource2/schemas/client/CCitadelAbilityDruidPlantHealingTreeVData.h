// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityDruidPlantHealingTreeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_HealingTreeModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_HealingFruitModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FruitGlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FruitPickupParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HealingAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HealingFruitModifier;
};
