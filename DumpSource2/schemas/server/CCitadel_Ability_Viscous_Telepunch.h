class CCitadel_Ability_Viscous_Telepunch : public CCitadelBaseAbility
{
	VectorWS m_vecTeleportPosition;
	Vector m_vecTeleportPositionNormal;
	ETelepunchState_t m_eTelepunchState;
	GameTime_t m_flNextStateTime;
};
