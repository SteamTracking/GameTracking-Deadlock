class C_Citadel_Pickup : public CBaseAnimGraph
{
	CHandle< C_BaseEntity > m_hAssignedClaimer;
	bool m_bActive;
	bool m_bInteractive;
	VectorWS m_vVacuumStartPos;
	Vector m_vInitialVacuumVel;
	CHandle< C_BaseEntity > m_hVacuumTarget;
	GameTime_t m_flVacuumStartTime;
	VectorWS m_vVacuumPos;
	float32 m_flLastFrameTime;
	bool m_bVacuumFinished;
};
