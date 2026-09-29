class CCitadelControlPointTrigger : public CTriggerMultiple
{
	CEntityIOOutput m_OnFullyCaptured;
	CEntityIOOutput m_OnBecomeCapturable;
	float32 m_flInitialRadius;
	float32 m_flEndRadius;
	// MNotSaved
	float32 m_flProgress;
	float32 m_flCaptureTime;
	// MNotSaved
	CHandle< CBaseEntity > m_hUnlockPrereq;
	// MNotSaved
	bool m_bAvailable;
	// MNotSaved
	bool m_bIsBeingCaptured;
	// MNotSaved
	bool m_bIsBeingBlocked;
	// MNotSaved
	GameTime_t m_flLastTouchedTime;
	// MNotSaved
	VectorWS m_vecBeamTarget;
	// MNotSaved
	VectorWS m_vecBeamStart;
	// MNotSaved
	ParticleIndex_t m_nFXProgressBeam;
	CUtlSymbolLarge m_strUnlockPrereq;
	CUtlSymbolLarge m_strBeamStart;
	CUtlSymbolLarge m_strBeamTarget;
};
