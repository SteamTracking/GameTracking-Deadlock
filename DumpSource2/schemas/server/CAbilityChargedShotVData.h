// MHasKV3TransferPolymorphicClassname
class CAbilityChargedShotVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShootParticle;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "Wall ricochet only happens off surfaces whose normal Z is at or below this (0 = vertical wall, 1 = flat floor)"
	float32 m_flWallRicochetMaxNormalZ; // = 0.7
	// MPropertyDescription = "Ricochet arrow speed as a multiple of the arrow's base bullet speed"
	float32 m_flWallRicochetSpeedScale; // = 0.5
};
