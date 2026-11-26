// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Fencer_Riposte : public C_CitadelBaseAbility
{
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecDeflectedTargets;
	VectorWS m_vRiposteStartPosition;
	Vector m_vDashDirection;
	CHandle< C_BaseEntity > m_hDashTarget;
	GameTime_t m_flStateStartTime;
	uint8 m_nCurrentRiposteState;
	GameTime_t m_flSuccessfulRiposteTime;
	VectorWS m_vecLastPosition;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_nParriedFXIndex;
};
