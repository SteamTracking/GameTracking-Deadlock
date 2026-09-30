// MHasKV3TransferPolymorphicClassname
class CCitadel_UtilityUpgrade_RocketBoosterVData : public CCitadel_UtilityUpgrade_RocketBootsVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LandingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DropDownStartParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_DropDownStartSound;
	CSoundEventName m_LandingSound;
	CSoundEventName m_strInAirLoopingSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BarrierModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flSlamEnabledTime; // = 0.2
};
