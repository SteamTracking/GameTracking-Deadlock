// MNetworkVarNames = "bool m_bActive"
// MNetworkVarNames = "bool m_bInteractive"
// MNetworkVarNames = "Vector m_vVacuumStartPos"
// MNetworkVarNames = "Vector m_vInitialVacuumVel"
// MNetworkVarNames = "CHandle< CBaseEntity> m_hVacuumTarget"
// MClassHasEntityLimitedDataDesc
class C_Citadel_Pickup : public CBaseAnimGraph
{
	// MNetworkEnable
	// MNetworkChangeCallback = "OnActiveChanged"
	bool m_bActive;
	// MNetworkEnable
	// MNetworkChangeCallback = "OnInteractiveChanged"
	bool m_bInteractive;
	// MNetworkEnable
	Vector m_vVacuumStartPos;
	// MNetworkEnable
	Vector m_vInitialVacuumVel;
	// MNetworkEnable
	// MNetworkChangeCallback = "OnVacuumTargetChanged"
	CHandle< C_BaseEntity > m_hVacuumTarget;
	GameTime_t m_flVacuumStartTime;
	VectorWS m_vVacuumPos;
	float32 m_flLastFrameTime;
	bool m_bVacuumFinished;
};
