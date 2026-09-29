class PlayOfTheGamePlaybackData_t
{
	CNetworkUtlVectorBase< CPlayerSlot > m_vecParticipants;
	CUtlVectorEmbeddedNetworkVar< PlayOfTheGameTrigger_t > m_vecTriggers;
	GameTime_t m_tBeginTimeWithPrewarm;
	GameTime_t m_tEndTime;
};
