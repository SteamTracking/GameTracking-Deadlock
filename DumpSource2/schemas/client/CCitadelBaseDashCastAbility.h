class CCitadelBaseDashCastAbility : public C_CitadelBaseAbility
{
	CHandle< C_CitadelBaseAbility > m_hAbilityToTrigger;
	GameTime_t m_flDashCastStartTime;
	Vector m_vDashCastDir;
};
