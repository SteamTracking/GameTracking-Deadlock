class CCitadel_Modifier_Feared : public CCitadelModifier
{
	VectorWS m_vecFearLocation;
	CHandle< CBaseEntity > m_hFearEntity;
	Vector m_vecFleeDirection;
	GameTime_t m_flLastFleeDirectionChange;
};
