// MHasKV3TransferPolymorphicClassname
class CCitadel_UtilityUpgrade_RocketBootsVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaunchParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InAirWatcherModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinHeadClearance; // = 150
};
