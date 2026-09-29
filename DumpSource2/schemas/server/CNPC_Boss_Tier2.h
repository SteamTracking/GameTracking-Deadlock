class CNPC_Boss_Tier2 : public CAI_CitadelNPC
{
	int32 m_iLane;
	// MNotSaved
	CHandle< CBaseEntity > m_hTargetedEnemy;
	// MNotSaved
	GameTime_t m_flFadeOutStart;
	// MNotSaved
	GameTime_t m_flFadeOutEnd;
	// MNotSaved
	GameTime_t m_flLastWeakpointHitTime;
	VectorWS m_vecElectricBeamLookTarget;
	int32 m_nElectricBeamCasts;
	CEntityIOOutput m_eventOnBossKilled;
};
