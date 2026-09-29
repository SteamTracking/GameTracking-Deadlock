class CCitadel_Ability_Bull_Charge : public CCitadelBaseAbility
{
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEntities;
	bool m_bGainedWeaponPowerBuff;
	QAngle m_anglesCharging;
	GameTime_t m_flChargeStartTime;
	GameTime_t m_flFastChargeStartTime;
	GameTime_t m_flFastChargeEndTime;
	bool m_bHitSomethingStunnable;
	bool m_bFirstTick;
	Vector m_vGoalDir;
};
