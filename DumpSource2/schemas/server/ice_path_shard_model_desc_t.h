class ice_path_shard_model_desc_t
{
	int32 m_nModelID;
	Vector2D m_vecPanelSize;
	CNetworkUtlVectorBase< VectorWS > m_vecPanelVertices;
	float32 m_flThickness;
	CUtlStringToken m_SurfacePropStringToken;
};
