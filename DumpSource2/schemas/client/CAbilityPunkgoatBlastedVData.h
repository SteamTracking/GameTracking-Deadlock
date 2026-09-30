// MHasKV3TransferPolymorphicClassname
class CAbilityPunkgoatBlastedVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BlastedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BlastedPassiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ShredModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HealthModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HealthDisplayModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeReloadFX;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strMeleeReloadSoundLight;
	CSoundEventName m_strMeleeReloadSoundHeavy;
};
