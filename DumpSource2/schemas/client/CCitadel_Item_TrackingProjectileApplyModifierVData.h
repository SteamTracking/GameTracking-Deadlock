// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_TrackingProjectileApplyModifierVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProjectileImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyOnlyModifier;
	// MPropertyDescription = "Optional. Applied to the caster on cast for the ability's duration - use for a self-cost."
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
};
