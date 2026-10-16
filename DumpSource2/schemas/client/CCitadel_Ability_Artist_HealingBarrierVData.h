// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_HealingBarrierVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BarrierCastParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BarrierModifier;
};
