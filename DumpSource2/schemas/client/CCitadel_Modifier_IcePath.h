class CCitadel_Modifier_IcePath : public CCitadelModifier
{
	int32 m_iShardCount;
	VectorWS m_vLastShardPosition;
	CHandle< C_BaseModelEntity > m_hSurfShard;
	CHandle< C_BaseModelEntity > m_hLastSpawnedShard;
};
