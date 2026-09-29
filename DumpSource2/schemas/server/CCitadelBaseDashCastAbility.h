class CCitadelBaseDashCastAbility : public CCitadelBaseAbility
{
	CHandle< CCitadelBaseAbility > m_hAbilityToTrigger;
	GameTime_t m_flDashCastStartTime;
	Vector m_vDashCastDir;
};
