// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nano_CatFormVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PoofInParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PoofOutParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strMeow;
	CSoundEventName m_strCatFormMeleeSwing;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamageAmpModifier;
};
