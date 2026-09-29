// MAbilityDynamicValuesSuppressCacheWhileActive
class CAbility_Fencer_Lunge : public C_CitadelBaseAbility
{
	uint8 m_nCurrentLungeState;
	GameTime_t m_flStateStartTime;
	VectorWS m_vDashStartPos;
	Vector m_vDashDirection;
	Vector m_vLookDirection;
	Vector m_vStrikeDirection;
	bool m_bStartedInAir;
	uint8 m_iRemainingCasts;
	GameTime_t m_RecastEndTime;
	uint8 m_eLungeDirection;
	float32 m_flHeldTime;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitEnemies;
	VectorWS m_vLastPosition;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_nGlintParticleIndex;
	float32 m_flLastOuterCircleProgress;
	int32 m_nPowerLevel;
};
