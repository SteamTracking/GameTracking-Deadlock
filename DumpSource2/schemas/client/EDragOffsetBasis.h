enum EDragOffsetBasis : uint8_t
{
	// MPropertyDescription = "Offset is captured once in world space and never rotates.  The victim keeps the same relative position however the source turns."
	EDragOffset_WorldFixed = 0,
	// MPropertyDescription = "Offset is in front of the source."
	EDragOffset_SourceFacing = 1,
	// MPropertyDescription = "Hold point is rebuilt every tick from the direction the source is travelling."
	EDragOffset_SourceVelocity = 2,
	// MPropertyDescription = "Hold point is rebuilt every tick from the direction the source is looking."
	EDragOffset_SourceView = 3,
};
