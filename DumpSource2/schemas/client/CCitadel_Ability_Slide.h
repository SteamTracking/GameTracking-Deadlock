// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Slide : public C_CitadelBaseAbility
{
	CCitadelAutoScaledTime m_flGroundDashSlideTime;
	GameTime_t m_flSlowGetupStartTime;
	bool m_bShouldTriggerSlowGetup;
	bool m_bWantsSlide;
	bool m_bAirborneWhenDuckPressed;
	bool m_bIsSliding;
	bool m_bSlideIsSticky;
	float32 m_flSpeedAdjust;
	GameTime_t m_flDuckPressedTime;
	GameTime_t m_flSlideChangeTime;
	GameTime_t m_flSlidingOnFlatStartTime;
	int32 m_nJumpsThisSlideSession;
	GameTime_t m_flOnGroundStartTime;
	GameTime_t m_flDashSlideStartTime;
	bool m_bStartedSlideViaProbeSlope;
	GameTick_t m_nForcedAllowRestartSlideTick;
	HeroID_t m_unHeroID;
	ParticleIndex_t m_nSlideEffectIndex;
};
