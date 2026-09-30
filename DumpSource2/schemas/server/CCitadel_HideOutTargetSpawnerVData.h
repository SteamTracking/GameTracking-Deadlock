// MHasKV3TransferPolymorphicClassname
class CCitadel_HideOutTargetSpawnerVData : public CEntitySubclassVDataBase
{
	float32 m_flThinkRate; // = 1
	float32 m_flFirstThink; // = 4
	// MPropertyStartGroup = "Pigeon Gameplay"
	int32 m_flPigeonMaxCount; // = 10
	// MPropertyStartGroup = "Ball Gameplay"
	float32 m_flBallMaxDist; // = 3000
	float32 m_flBallGoalThresHold; // = 40
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BallScored;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BallSpawned;
};
