class CNPC_Boss_Tier3 : public CAI_CitadelNPC
{
	// MNotSaved
	int32 m_iLane;
	VectorWS m_vecElectricBeamTargetEnd;
	CEntityIOOutput m_eventOnBossKilled;
	CEntityIOOutput m_eventOnPhase1End;
	CUtlSymbolLarge m_backdoorProtectionTrigger;
	// MNotSaved
	ETier3State_t m_eAliveState;
	// MNotSaved
	ETier3Phase_t m_ePhase;
	VectorWS m_vShrineAttackTargetPos;
};
