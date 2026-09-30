class NPCAILODDesc_t
{
	int32 m_nMaxNPCs;
	float32 m_flMinRange;
	float32 m_flOffNavLastKnownAreaUpdateInterval;
	bool m_bSensing; // = true
	bool m_bSensingUseExactEyePosition; // = true
	bool m_bDecisionMaking; // = true
	bool m_bUseLocalNavigator; // = true
	bool m_bUseAdvancedLocomotion; // = true
	bool m_bEnableFootSweeps; // = true
	bool m_bDetailedLookTargets; // = true
	bool m_bShouldGenerateAIFootstepEvents; // = true
	bool m_bRagdollEnabled; // = true
	bool m_bEnableFlinching; // = true
	bool m_bEnableWarnNPCsOfIncomingFire; // = true
	bool m_bEnableBlinking; // = true
};
