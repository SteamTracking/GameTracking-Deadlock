class PlayOfTheGamePlaybackData_t
{
	C_NetworkUtlVectorBase< CPlayerSlot > m_vecParticipants;
	C_UtlVectorEmbeddedNetworkVar< PlayOfTheGameTrigger_t > m_vecTriggers;
	GameTime_t m_tBeginTimeWithPrewarm;
	GameTime_t m_tEndTime;
};
