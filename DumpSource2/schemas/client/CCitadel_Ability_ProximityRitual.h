class CCitadel_Ability_ProximityRitual : public C_CitadelBaseAbility
{
	ECatStatueState_t m_eState;
	CHandle< C_BaseEntity > m_hStatue;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
};
