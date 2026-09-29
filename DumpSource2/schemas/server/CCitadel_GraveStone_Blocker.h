class CCitadel_GraveStone_Blocker : public CCitadelAnimatingModelEntity
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CHandle< CCitadelBaseAbility > m_hAbility;
	int32 m_iGravestoneState;
	float32 m_flLifetime;
};
