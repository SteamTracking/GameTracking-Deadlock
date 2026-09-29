class CCitadel_Modifier_IcePath : public CCitadelModifier
{
	int32 m_iShardCount;
	VectorWS m_vLastShardPosition;
	CHandle< CBaseModelEntity > m_hSurfShard;
	CHandle< CBaseModelEntity > m_hLastSpawnedShard;
};
