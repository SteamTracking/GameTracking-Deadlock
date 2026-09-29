class CAbility_TestHero_SpookyHide : public CCitadelBaseAbility
{
	CModifierHandleTyped< CCitadelModifier > m_hInvisModifier;
	bool m_bIsVisibleOnMinimap;
	GameTime_t m_flStoppedMovingStartTime;
	VectorWS m_vLastPos;
};
