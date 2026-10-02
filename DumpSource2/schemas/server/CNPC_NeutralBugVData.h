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
	CSubclassName< 3 > m_sReplacementSubclass;
	float32 m_flReplacementChance;
	CSubclassName< 3 > m_sDeathSwarmSubclass;
	int32 m_nDeathSwarmCount;
	HeroID_t m_DeathSwarmImmuneHeroID;
	// MPropertyDescription = "Death swarm rats spawn at a random point this far from the killer (0 max spawns them where this died)"
	float32 m_flDeathSwarmSpawnDistMin;
	float32 m_flDeathSwarmSpawnDistMax;
	float32 m_flStepHeight; // = 32
	float32 m_flChaseLifetime; // = 5
	float32 m_flAttachRadius; // = 64
	float32 m_flAttachHeight; // = 96
	CEmbeddedSubclass< CCitadelModifier > m_SwarmModifier;
	// MPropertyStartGroup = "Visuals"
	bool m_bIsRat;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathParticle;
	float32 m_flModelScale; // = 1
	CUtlVector< CUtlString > m_vecRunSequences;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLastHitSound;
	CSoundEventName m_strRatAttachSound;
};
