// MHasKV3TransferPolymorphicClassname
class CNPC_NeutralBugVData : public CEntitySubclassVDataBase
{
	int32 m_iGoldReward;
	float32 m_flRadius; // = 20
	float32 m_flDropDownRate; // = 40
	float32 m_flRespawnTime; // = 30
	float32 m_flRespawnTimeHeroTest; // = 5
	float32 m_flWaitTimeMax; // = 5
	float32 m_flPlayerCheckThink; // = 10
	float32 m_flPlayerCheckDistanceM; // = 30
	float32 m_flMaxMoveDistance; // = 100
	float32 m_flMinMoveDistance; // = 20
	float32 m_flMoveSpeedMin; // = 150
	float32 m_flMoveSpeedMax; // = 200
	float32 m_flValidDirectionDist; // = 200
	float32 m_flValidMinDist; // = 20
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathParticle;
};
