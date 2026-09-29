class CCitadelTriggerCapturePoint : public CBaseTrigger
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CEntityIOOutput m_OnBecomeCapturable;
	CEntityOutputTemplate< int32 > m_OnFullyCaptured;
	CUtlSymbolLarge m_iszGroupName;
	ParticleIndex_t m_nEnabledParticle;
	ParticleIndex_t m_nPreEnableFX;
	GameTime_t m_tQueuedEnableTime;
	float32 m_flCaptureProgress;
	int32 m_nCaptureProgressOwner;
	int32 m_nActivelyCapturingTeam;
	int32 m_nActiveCapturers;
	uint8 m_nEnableState;
};
