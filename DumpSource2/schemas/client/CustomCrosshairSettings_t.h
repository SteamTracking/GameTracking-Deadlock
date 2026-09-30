class CustomCrosshairSettings_t
{
	int32 m_nPipWidth;
	int32 m_nPipHeight;
	int32 m_nPipOutlineWidth;
	int32 m_nPipOutlineGap;
	float32 m_flPipOpacity;
	float32 m_flPipOutlineOpacity;
	Color m_PipColor; // = [ 255, 255, 255 ]
	Color m_PipOutlineColor;
	int32 m_nDotRadius;
	int32 m_nDotOutlineWidth;
	int32 m_nDotOutlineGap;
	float32 m_flDotOpacity;
	float32 m_flDotOutlineOpacity;
	Color m_DotColor; // = [ 255, 255, 255 ]
	Color m_DotOutlineColor;
	CrosshairSpreadIndicatingElement m_SpreadIndicatingElement; // = "LINE_GAP"
	float32 m_flBaseSpread;
};
