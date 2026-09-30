// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_TrackingBombVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VialDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HowlDebuffModifier;
};
