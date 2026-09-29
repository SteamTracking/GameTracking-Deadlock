class CCitadelTriggerMultiCapturePoint : public CBaseTrigger
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CEntityIOOutput m_OnBecomeCapturable;
	CEntityOutputTemplate< int32 > m_OnFullyCaptured;
	CUtlSymbolLarge m_iszGroupName;
	ParticleIndex_t m_nEnabledParticle;
	ParticleIndex_t m_nPreEnableFX;
	uint8 m_nEnableState;
};
