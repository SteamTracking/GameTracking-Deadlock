class CCitadel_Ability_PsychicLift : public CCitadelBaseAbility
{
	VectorWS m_vLiftPosition;
	VectorWS m_vCrashPosition;
	CUtlVector< CHandle< CBaseEntity > > m_vecLiftTargets;
};
