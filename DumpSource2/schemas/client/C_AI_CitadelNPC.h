class C_AI_CitadelNPC : public C_AI_BaseNPC
{
	bool m_bBeamActive;
	VectorWS m_vEyeBeamTarget;
	// MNotSaved
	int32 m_nPlayerTeamEvent;
	// MNotSaved
	C_UtlVectorEmbeddedNetworkVar< WeakPoint_t > m_vecWeakPoints;
	// MNotSaved
	bool m_bMinion;
	// MNotSaved
	CHandle< C_BaseEntity > m_hLookTarget;
	CCitadelAbilityComponent m_CCitadelAbilityComponent;
};
