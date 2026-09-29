class CCitadel_Ability_Necro_GraveStone : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecDeployedGravestones;
	VectorWS m_vCastPosition;
	QAngle m_qCastAngle;
};
