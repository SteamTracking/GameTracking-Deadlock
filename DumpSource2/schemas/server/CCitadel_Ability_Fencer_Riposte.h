// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Fencer_Riposte : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecDeflectedTargets;
	VectorWS m_vRiposteStartPosition;
	Vector m_vDashDirection;
	CHandle< CBaseEntity > m_hDashTarget;
	GameTime_t m_flStateStartTime;
	uint8 m_nCurrentRiposteState;
	GameTime_t m_flSuccessfulRiposteTime;
	VectorWS m_vecLastPosition;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_nParriedFXIndex;
};
