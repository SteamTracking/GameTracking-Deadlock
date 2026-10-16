class CCitadel_Ability_Artist_BouncingPot : public CCitadelBaseAbility
{
	CUtlVector< CHandle< CBaseEntity > > m_vecGroundAuras;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitUnits;
	ShotID_t m_tInitialShotID;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
};
