class CCitadel_Modifier_Feared : public CCitadelModifier
{
	VectorWS m_vecFearLocation;
	CHandle< C_BaseEntity > m_hFearEntity;
	Vector m_vecFleeDirection;
	GameTime_t m_flLastFleeDirectionChange;
};
