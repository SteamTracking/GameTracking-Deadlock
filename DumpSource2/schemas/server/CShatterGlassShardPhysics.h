class CShatterGlassShardPhysics : public CBaseModelEntity
{
	uint32 m_hParentShard;
	shard_model_desc_t m_ShardDesc;
	ShatterGlassEntityPoolState_t m_nPoolState;
	bool m_bTouchedByPlayer;
};
