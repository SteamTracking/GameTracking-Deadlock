// MVDataOverlayType = 1
// MHasKV3TransferPolymorphicClassname
class CNPC_Escort_VData : public CAI_CitadelNPCVData
{
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Particle that plays when spawned."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSpawnParticle;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "How far to search for friendly players for deploying our shield and slow walking. Only applies if players are behind"
	float32 m_flEscortFriendlyHeroSlowMoveSearchRadius; // = 1500
	// MPropertyDescription = "How far to search for friendly players for deploying our shield and fast walking"
	float32 m_flEscortFriendlyHeroFastMoveSearchRadius; // = 1000
	// MPropertyDescription = "Stop walking when we detect an objective this far away."
	float32 m_flEscortEnemyObjectiveSearchRadius; // = 2000
	// MPropertyDescription = "Disable fast walk if Enemies are within this range"
	float32 m_flEscortEnemySlowWalkRadius; // = 787.401978
	// MPropertyDescription = "How close is close enough for pathfinding to a node."
	float32 m_flCloseEnoughToNode; // = 200
	// MPropertyDescription = "When we detect friendly players in front of us, apply this scale to our walking speed so we'll catch up to them."
	float32 m_flCatchUpSpeed; // = 1.5
	// MPropertyDescription = "How long after destroying 3 T1s and T2s does it take for the Vanguard to activate and start walking."
	float32 m_flActivateDelay; // = 1
};
