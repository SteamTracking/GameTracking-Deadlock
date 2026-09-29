class C_PointCommentaryNode : public CBaseAnimGraph
{
	bool m_bActive;
	bool m_bWasActive;
	GameTime_t m_flEndTime;
	GameTime_t m_flStartTime;
	float32 m_flStartTimeInCommentary;
	CUtlSymbolLarge m_iszCommentaryFile;
	CUtlSymbolLarge m_iszTitle;
	CUtlSymbolLarge m_iszSpeakers;
	int32 m_iNodeNumber;
	int32 m_iNodeNumberMax;
	bool m_bListenedTo;
	CSoundPatch* m_sndCommentary;
	CHandle< C_BaseEntity > m_hViewPosition;
	// MNotSaved
	bool m_bRestartAfterRestore;
};
