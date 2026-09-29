class CNPC_BarrackBoss : public CAI_CitadelNPC
{
	CCitadelPlayerClipComponent m_CCitadelPlayerClipComponent;
	int32 m_iLane;
	CHandle< CBaseEntity > m_hTrooperSpawnPoint;
	LaneSide_t m_LaneSide;
	// MNotSaved
	GameTime_t m_flFadeOutStart;
	// MNotSaved
	GameTime_t m_flFadeOutEnd;
};
