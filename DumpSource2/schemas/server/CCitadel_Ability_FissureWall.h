class CCitadel_Ability_FissureWall : public CCitadelBaseAbility
{
	VectorWS m_vecPosition;
	VectorWS m_vecTravellingPosition;
	VectorWS m_vecInitialPosition;
	GameTime_t m_CastTime;
	Vector m_vecDirection;
	Vector m_vecLeft;
	float32 m_Length;
	bool m_bTraveling;
	bool m_bPreview;
};
