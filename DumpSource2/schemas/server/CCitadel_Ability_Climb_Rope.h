class CCitadel_Ability_Climb_Rope : public CCitadelBaseAbility
{
	CNetworkOriginQuantizedVectorWS m_vTop;
	CNetworkOriginQuantizedVectorWS m_vBottom;
	GameTime_t m_flActivatePressTime;
	GameTime_t m_flDisconnectTime;
	GameTime_t m_flClimbStartTime;
	bool m_bNoDelayNeeded;
	bool m_bMouseWheelBind;
	VectorWS m_vLastPos;
	bool m_bRequestStopClimbing;
	bool m_bRequestJumpToRoof;
	GameTime_t m_flMoveDownStartTime;
	EClimbRopeState_t m_eClimbState;
};
