class CCitadel_Neutral_LaserBeam : public CCitadel_Modifier_NeutralAbility
{
	ParticleIndex_t m_nChargeEffect;
	ParticleIndex_t m_nPreviewEffect;
	VectorWS m_vInitialTargetPos;
	GameTime_t m_flNextAuraDropTick;
	GameTime_t m_tLastToggleTime;
	CCitadelAbilityBeam_t m_beam;
	bool m_bBeamInit;
	float32 m_flYaw;
};
