class CitadelMusicChord_t
{
	float32 m_flStartTime;
	CitadelArpeggiatorMode_t m_ArpeggiatorMode; // = "EArpMode_Default"
	uint8 m_nNumOctaves; // = 1
	CUtlVector< CitadelMidiNotePitch_t > m_ChordVoicing;
	CUtlString m_strRenderedChordEvent;
};
