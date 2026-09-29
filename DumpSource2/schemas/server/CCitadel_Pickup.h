class CCitadel_Pickup : public CBaseAnimGraph
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CHandle< CBaseEntity > m_hAssignedClaimer;
	bool m_bActive;
	bool m_bInteractive;
	VectorWS m_vVacuumStartPos;
	Vector m_vInitialVacuumVel;
	CHandle< CBaseEntity > m_hVacuumTarget;
	VectorWS m_vVacuumPos;
	GameTime_t m_flVacuumStartTime;
	Vector m_vImpactVel;
	VectorWS m_vImpactPos;
	GameTime_t m_flImpactTime;
};
