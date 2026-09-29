// MModifierDynamicValuesSuppressCache
class CCitadel_Ability_Shiv_KillingBlow : public CCitadelBaseShivAbility
{
	CUtlVector< CHandle< C_BaseEntity > > m_vHitEnts;
	bool m_bDamagedAnyHero;
	bool m_bActive;
	bool m_bStartedOnGround;
	bool m_bIsBonusCast;
	VectorWS m_vStartPosition;
	QAngle m_qCurrentAngles;
	CCitadelAutoScaledTime m_flDepartureTime;
	CCitadelAutoScaledTime m_flArrivalTime;
	VectorWS m_vLastKnownSafePos;
	bool m_bMadeSlashParticle;
	GameTime_t m_flRecastWindowEnd;
};
