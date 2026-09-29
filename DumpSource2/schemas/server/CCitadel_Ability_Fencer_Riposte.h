// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Fencer_Riposte : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hTarget;
	VectorWS m_vRiposteStartPosition;
	Vector m_vDashDirection;
	GameTime_t m_flStateStartTime;
	uint8 m_nCurrentRiposteState;
	GameTime_t m_flSuccessfulRiposteTime;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEnemies;
	VectorWS m_vecLastPosition;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_nParriedFXIndex;
};
