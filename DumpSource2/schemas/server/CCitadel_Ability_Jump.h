// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Jump : public CCitadelBaseAbility
{
	GameTime_t m_flLastTimeOnZipLine;
	GameTime_t m_flLastOnGroundTime;
	GameTime_t m_flPhaseStartTime;
	GameTime_t m_flJumpTime;
	GameTime_t m_flWallJumpFatigueStartTime;
	GameTime_t m_flLastThinkTime;
	Vector m_vCurrentWallNormal;
	Vector m_vLastWallCollidedWithNormal;
	Vector m_vLastValidWallJumpNormal;
	VectorWS m_vLastValidWallJumpNormal_PlayerPosition;
	GameTime_t m_flLastWallJumpTime;
	Vector m_vWallJumpFacingDir;
	EWallJumpFacing m_eWallJumpFacing;
	float32 m_flLastWallJumpFatigueStrength;
	EJumpType_t m_LastJumpType;
	bool m_bShouldCreateAirJumpEffects;
	GameTime_t m_flDoubleJumpFailTime;
	ECitadelAbilityOrders m_eDoubleJumpFailReason;
	Vector m_vWallJumpNormalUsed;
	bool m_bResolvingAirJump;
	CCitadelAutoScaledTime m_flDashJumpStartTime;
	CCitadelAutoScaledTime m_flDashJumpEndTime;
	bool m_bJumped;
	bool m_bCanDashJump;
	int32 m_nDesiredAirJumpCount;
	int32 m_nExecutedAirJumpCount;
	bool m_bInSlideJump;
	int8 m_nConsecutiveAirJumps;
	int8 m_nConsecutiveWallJumps;
	GameTime_t m_flLateralInputSuppressEndTime;
};
