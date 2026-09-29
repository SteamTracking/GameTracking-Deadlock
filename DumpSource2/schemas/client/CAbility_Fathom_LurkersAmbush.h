class CAbility_Fathom_LurkersAmbush : public C_CitadelBaseAbility
{
	CModifierHandleTyped< CCitadelModifier > m_hRegenModifier;
	CModifierHandleTyped< CCitadelModifier > m_hInvisModifier;
	bool m_bIsVisibleOnMinimap;
	GameTime_t m_flStoppedMovingStartTime;
	VectorWS m_vLastPos;
	float32 m_flDebuffDuration;
	GameTime_t m_flChannelTimeStarted;
	bool m_bWasLatchedWhenCast;
	ParticleIndex_t m_ChargeUpParticle;
};
