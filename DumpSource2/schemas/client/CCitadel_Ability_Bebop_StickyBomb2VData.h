// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bebop_StickyBomb2VData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RestrictionModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
