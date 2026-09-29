// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Dash : public CCitadelBaseAbility
{
	float32 m_flDashAngle;
	GameTime_t m_GroundDashExecuteTime;
	GameTime_t m_GroundDashCancelExecuteTime;
	int32 m_nLastGroundDashTick;
	bool m_bAnglesControlActive;
	GameTime_t m_flAirDashCastTime;
	VectorWS m_flAirDashStartPos;
	GameTime_t m_flAirDashDragStartTime;
	GameTime_t m_flParryCancelSlideEndTime;
	GameTime_t m_flParryCancelAirGlideStartTime;
	int8 m_nConsecutiveAirDashes;
	int8 m_nConsecutiveDownDashes;
	bool m_bDownAirDash;
	GameTime_t m_flAirDashDelayedEffectsTime;
};
