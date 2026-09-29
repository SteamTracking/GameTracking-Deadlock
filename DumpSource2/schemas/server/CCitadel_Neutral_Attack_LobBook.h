class CCitadel_Neutral_Attack_LobBook : public CCitadel_Neutral_Attack_BulletToPointModifier
{
	bool m_bFirstBullet;
	VectorWS m_vTargetLocation;
	int32 m_nBooksLanded;
	int32 m_nBooksExpected;
	CHandle< CPointModifierThinker > m_hPointThinker;
	CModifierHandleTyped< CCitadelModifier > m_pShotCounterAutoModifier;
};
