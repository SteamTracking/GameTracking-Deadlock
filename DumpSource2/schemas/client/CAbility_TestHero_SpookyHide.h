class CAbility_TestHero_SpookyHide : public C_CitadelBaseAbility
{
	CModifierHandleTyped< CCitadelModifier > m_hInvisModifier;
	bool m_bIsVisibleOnMinimap;
	GameTime_t m_flStoppedMovingStartTime;
	VectorWS m_vLastPos;
};
