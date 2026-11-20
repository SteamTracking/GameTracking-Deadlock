class PingSlotOverride_t
{
	// MPropertyDescription = "What has to be true. Leave empty and this override always wins, which is only useful as the last entry in a list."
	PingConditions_t m_when;
	// MPropertyDescription = "What to say when it is."
	PingSlotOption_t m_Option;
	// MPropertyDescription = "Instead of saying something else, say nothing. The segment still draws so nothing shifts, but it reads as a gap and places a plain marker."
	bool m_bDisabled;
};
