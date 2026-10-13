// MModifierDynamicValuesSuppressCache
class CCitadel_Ability_Deadpack_Rocketeer : public C_CitadelBaseAbility
{
	Vector m_vIntentSpaceVelocities;
	Vector m_vIntentSpaceCurrent;
	Vector m_vIntentSpaceTarget;
	Vector m_vVelocity;
	GameTime_t m_tStateEnterTime;
	GameTime_t m_tGravityReductionStartTime;
	GameTime_t m_tGravityReductionEndTime;
	GameTime_t m_tJetpackInputHeldBeginTime;
	GameTime_t m_tLastDashJumpTime;
	Vector m_vSputterIntents;
	Vector m_vVTOLVel;
	float32 m_flStartHeight;
	float32 m_flInitialYaw;
	bool m_bDiveStraightDown;
	float32 m_flCastDelayFrac;
	GameTime_t m_tHeatDecayStartTime;
	ERocketeerState m_eState;
};
