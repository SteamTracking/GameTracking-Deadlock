class CIcePathShardGenerator
{
	ice_path_shard_model_desc_t m_icePathModelDesc;
	CStrongHandle< InfoForResourceTypeCModel > m_hBaseModel;
	ice_path_shard_model_desc_t m_icePathSurfModelDesc;
	CStrongHandle< InfoForResourceTypeCModel > m_hSurfModel;
	float32 m_flRadius;
	CUtlVector< VectorWS > m_vecPreviousShard;
	VectorWS m_vecPreviousShardOrigin;
	VectorWS m_vecPreviousPreviousShardOrigin;
	CUtlVector< Vector > m_vecUnitCirclePoints;
	CUtlVector< VectorWS > m_vPrevFrontEdgeVerts;
};
