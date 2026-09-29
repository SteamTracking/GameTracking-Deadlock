class CCitadel_WeaponUpgrade_ExpressShot : public CCitadel_Item
{
	int32 m_iShotsToCreate;
	bool m_bIsInExpressShot;
	bool m_bProcShotCharged;
	float32 m_flProcChargeBonusDamage;
	GameTime_t m_tNextShotTime;
	bool m_bIsPrimaryProc;
};
