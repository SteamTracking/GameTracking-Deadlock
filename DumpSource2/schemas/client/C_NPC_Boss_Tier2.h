class C_NPC_Boss_Tier2 : public C_AI_CitadelNPC
{
	// MNotSaved
	int32 m_iLane;
	// MNotSaved
	GameTime_t m_flFadeOutStart;
	// MNotSaved
	GameTime_t m_flFadeOutEnd;
	// MNotSaved
	GameTime_t m_flLastWeakpointHitTime;
	// MNotSaved
	CHandle< C_BaseEntity > m_hTargetedEnemy;
	VectorWS m_vecElectricBeamLookTarget;
	int32 m_nElectricBeamCasts;
};
