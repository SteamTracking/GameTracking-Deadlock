// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Wraith_RapidFireVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetBuffSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RapidFireModifier;
};
