class CCitadel_Ability_Necro_GraveStone : public C_CitadelBaseAbility
{
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecDeployedGravestones;
	VectorWS m_vCastPosition;
	QAngle m_qCastAngle;
};
