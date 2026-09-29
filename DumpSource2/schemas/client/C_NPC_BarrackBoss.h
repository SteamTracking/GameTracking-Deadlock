class C_NPC_BarrackBoss : public C_AI_CitadelNPC
{
	CCitadelPlayerClipComponent m_CCitadelPlayerClipComponent;
	// MNotSaved
	int32 m_iLane;
	// MNotSaved
	GameTime_t m_flFadeOutStart;
	// MNotSaved
	GameTime_t m_flFadeOutEnd;
};
