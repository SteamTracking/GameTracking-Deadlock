// MModifierDynamicValuesSuppressCache
class CCitadel_Ability_Hook : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hHookVictim;
	VectorWS m_vecHookTargetStartPos;
	GameTime_t m_flCancelHookTime;
	GameTime_t m_flBeginReelHookTime;
	GameTime_t m_flBulletShouldExpireTime;
	float32 m_flMaxHookTravelTime;
};
