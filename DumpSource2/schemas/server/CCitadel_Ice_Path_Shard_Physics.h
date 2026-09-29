class CCitadel_Ice_Path_Shard_Physics : public CBaseModelEntity
{
	ice_path_shard_model_desc_t m_ShardDesc;
	QAngle m_qForward;
	GameTime_t m_flStartTime;
	GameTime_t m_flEndTime;
	float32 m_flShardWidth;
};
