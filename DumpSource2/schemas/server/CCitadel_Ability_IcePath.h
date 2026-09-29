class CCitadel_Ability_IcePath : public CCitadelBaseAbility
{
	VectorWS m_vInitialPosition;
	CIcePathShardGenerator m_cShardGenerator;
	bool m_bIcePathing;
	QAngle m_qLastAngles;
	Vector m_vLastVelocity;
	bool m_bFirstMovementTick;
	GameTime_t m_tLingerMovementControlUntilTime;
};
