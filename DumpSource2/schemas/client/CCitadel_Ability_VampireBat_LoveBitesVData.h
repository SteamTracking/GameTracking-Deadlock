// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VampireBat_LoveBitesVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamageProcModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAttackerHitSound;
};
