// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_LionDanceVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PulseParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strPulseSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDebug;
	float32 m_flRecastTravelTime; // = 1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ActiveModifier;
};
