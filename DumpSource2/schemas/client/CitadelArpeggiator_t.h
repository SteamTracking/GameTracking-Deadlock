class CitadelArpeggiator_t
{
	CSoundEventName m_strSamplerEvent;
	CitadelMidiNotePitch_t m_nLowestNote; // = "EMidiNotePitch_0A"
	CitadelMidiNotePitch_t m_nHighestNote; // = "EMidiNotePitch_8C"
	CitadelArpeggiatorMode_t m_nDefaultArpMode; // = "EArpMode_Up"
	int32 m_nTransposeSteps;
};
