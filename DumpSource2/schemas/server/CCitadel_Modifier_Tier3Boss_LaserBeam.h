class CCitadel_Modifier_Tier3Boss_LaserBeam : public CCitadel_Modifier_Tier3Boss_Base
{
	VectorWS m_vStart;
	VectorWS m_vEnd;
	VectorWS m_vPrevEnd;
	float32 m_flAngleBetweenTrace;
	GameTime_t m_flNextDamageTick;
	GameTime_t m_flNextAuraDropTick;
	CUtlVector< CHandle< CBaseEntity > > m_vecEntitiesHit;
	GameTime_t m_flLastShakeTime;
	VectorWS m_vecBeamTarget;
	GameTime_t m_flLastBeamUpdateTime;
	VectorWS m_vecEnemyPosition;
	bool m_bPreviewMode;
	int32 m_iAttachmentIndex;
	AttachmentHandle_t m_hAttachment;
};
