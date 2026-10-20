// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nurse_AdrenalineRush_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CrashModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageSpiritParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CrashDamageSpiritParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDeferredDamageTickSound;
	CSoundEventName m_strDamageSpiritCreatedSound;
};
