class CCitadel_Ability_Artist_BouncingPot : public C_CitadelBaseAbility
{
	CUtlVector< CHandle< C_BaseEntity > > m_vecGroundAuras;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitUnits;
	ShotID_t m_tInitialShotID;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
};
