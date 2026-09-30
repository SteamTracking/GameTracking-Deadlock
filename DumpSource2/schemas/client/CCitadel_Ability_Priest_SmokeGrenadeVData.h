// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_SmokeGrenadeVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SmokeGrenadeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
