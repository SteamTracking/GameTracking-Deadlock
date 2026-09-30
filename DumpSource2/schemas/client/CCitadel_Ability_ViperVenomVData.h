// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ViperVenomVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VenomModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastVenomParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_VenomExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strVenomWeakExplode;
	CSoundEventName m_strVenomExplode;
	CSoundEventName m_strVenomStrongExplode;
};
