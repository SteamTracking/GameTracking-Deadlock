class C_NPC_Boss_Tier3 : public C_AI_CitadelNPC
{
	// MNotSaved
	int32 m_iLane;
	VectorWS m_vecElectricBeamTargetEnd;
	// MNotSaved
	ETier3State_t m_eAliveState;
	// MNotSaved
	ETier3Phase_t m_ePhase;
	VectorWS m_vShrineAttackTargetPos;
};
