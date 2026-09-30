// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_TestHero_StanceSwitchVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StanceSwapStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StanceSwapEndParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StanceActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CastModifier;
};
