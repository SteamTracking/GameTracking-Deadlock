class CCitadel_Ability_Mantle : public CCitadelBaseAbility
{
	float32 m_flVertOffset;
	float32 m_flHorizGap;
	VectorWS m_vStartPos;
	VectorWS m_vTargetPos;
	QAngle m_angFacing;
	int32 m_nMantleTypeIndex;
	GameTime_t m_flStartTime;
	GameTime_t m_flAutoMantlePushStartTime;
	GameTime_t m_flAutoMantleLastPushTime;
	VectorWS m_vAutoMantleLastPushPos;
};
