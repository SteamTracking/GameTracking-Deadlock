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
	// MPropertyDescription = "Pick a player target within this cone, from the ricochet point, along the natural reflection angle. Bias (but do not snap) the ricochet angle based on how close it already is to a direct shot."
	float32 m_flWallRicochetAimMagnetismHalfAngleCone; // = 15
	// MPropertyDescription = "Distance limit on the magnetism cone. 4000 units is roughly one second of projectile flight time"
	float32 m_flWallRicochetAimMagnetismConeLength; // = 4000
};
