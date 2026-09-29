class CCitadel_Ability_PsychicLift : public C_CitadelBaseAbility
{
	VectorWS m_vLiftPosition;
	VectorWS m_vCrashPosition;
	CUtlVector< CHandle< C_BaseEntity > > m_vecLiftTargets;
};
