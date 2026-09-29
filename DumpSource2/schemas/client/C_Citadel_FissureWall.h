class C_Citadel_FissureWall : public CBaseAnimGraph
{
	VectorWS m_vStartPos;
	VectorWS m_vEndPos;
	GameTime_t m_flStartEmitTime;
	GameTime_t m_flEndEmitTime;
	bool m_bSolid;
	int32 m_nTouchCount;
};
