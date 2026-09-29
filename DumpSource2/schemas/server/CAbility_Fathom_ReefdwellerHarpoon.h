class CAbility_Fathom_ReefdwellerHarpoon : public CCitadelBaseAbility
{
	bool m_bHitTarget;
	VectorWS m_vPrevPos;
	bool m_bBulletFlying;
	bool m_bHasLatchedOnce;
	bool m_bLatched;
	VectorWS m_vHarpoonTarget;
	float32 m_flLatchedYaw;
	GameTime_t m_flCloseEnoughStartTime;
	GameTime_t m_flStuckStartTime;
	GameTime_t m_flReelStartTime;
};
