// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_RootingProjectileVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HitModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RootModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldApplyHitModifier; // = true
	bool m_bShouldRootOnHit;
};
