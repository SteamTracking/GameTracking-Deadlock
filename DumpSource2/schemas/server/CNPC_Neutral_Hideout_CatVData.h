// MHasKV3TransferPolymorphicClassname
class CNPC_Neutral_Hideout_CatVData : public CEntitySubclassVDataBase
{
	float32 m_flCollisionRadius; // = 120
	float32 m_flTraceRadius; // = 30
	float32 m_flTraceDistancePerIteration; // = 20
	int32 m_iMaxTraceIterations; // = 40
	float32 m_flStepUpHeight; // = 128
	float32 m_flParticleRadius; // = 1
	CRangeFloat m_flLifeTime; // = 10
	CRangeInt m_iHitsToDisappear; // = 5
	float32 m_flRespawnTime; // = 4
	CRangeFloat m_flModelScale; // = 0.5
	float32 m_flWalkSpeed; // = 200
	float32 m_flRunSpeed; // = 400
	CRangeFloat m_flRunDistanceMax; // = 1200
	float32 m_flDropDownRate; // = 40
	float32 m_flDistTolerance; // = 16
	float32 m_flValidDirectionDist; // = 150
	CRangeFloat m_flMoveAwayTime; // = 10
	float32 m_flChaseDistanceStart; // = 300
	float32 m_flChaseDistanceEnd; // = 400
	float32 m_flChaseDistTolerance; // = 32
	float32 m_flChaseAtTarget; // = 8
	float32 m_flBallSpeedMin; // = 200
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDestroySound;
};
