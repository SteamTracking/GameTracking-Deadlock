class ItemDraftRoundState_t
{
	C_UtlVectorEmbeddedNetworkVar< ItemDraftOption_t > m_vecOptions;
	ItemDraftRoundID_t m_nID;
	int32 m_nDraftsRemaining;
	int32 m_nDraftsTotal;
	int32 m_nRoundsRemaining;
	int32 m_nRoundsTotal;
	GameTime_t m_flCompletedTime;
};
