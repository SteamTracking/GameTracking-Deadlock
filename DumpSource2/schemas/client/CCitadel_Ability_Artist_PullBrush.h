class CCitadel_Ability_Artist_PullBrush : public C_CitadelBaseAbility
{
	SatVolumeIndex_t m_nSatVolumeIndex;
	float32 m_flAccumulatedDrawDistance;
	bool m_bPainting;
	GameTime_t m_tStopPaintingTime;
	CUtlVector< VectorWS > m_vecBrushPositions;
	Vector m_vecBrushVelocity;
	VectorWS m_vecBrushCurrentPosition;
};
