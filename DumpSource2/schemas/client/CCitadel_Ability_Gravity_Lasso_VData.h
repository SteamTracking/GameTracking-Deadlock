// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Gravity_Lasso_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_GravityLassoSelf;
	CEmbeddedSubclass< CBaseModifier > m_GravityLassoTarget;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetWarningSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PreCastParticle;
};
