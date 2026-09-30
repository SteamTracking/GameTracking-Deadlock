class CitadelMusicCueData_t
{
	CSoundEventName m_strSoundEvent;
	EMusicState_t m_nDeferState; // = "EMusicState_Invalid"
	float32 m_flBpm; // = -1
	float32 m_flExitTimeSeconds; // = -1
	bool m_bInterruptStop; // = true
	bool m_bSetToNoneStateWhenFinished; // = true
	CitadelMusicSyncMode_t m_nSyncMode; // = "ESyncMode_None"
	CUtlVector< float32 > m_SyncTimes;
	float32 m_flSyncOffset;
	CUtlOrderedMap< CUtlString, CitadelMusicChord_t > m_Chords;
	CUtlVector< CUtlString > m_Arpeggiators;
};
