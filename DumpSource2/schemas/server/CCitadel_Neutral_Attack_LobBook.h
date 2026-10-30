class CCitadel_Neutral_Attack_LobBook : public CCitadel_Neutral_Attack_BulletToPointModifier
{
	bool m_bFieldOpened;
	VectorWS m_vTargetLocation;
	GameTime_t m_tChannelStartTime;
	CHandle< CPointModifierThinker > m_hSleepField;
	CModifierHandleTyped< CCitadelModifier > m_pShotCounterAutoModifier;
};
