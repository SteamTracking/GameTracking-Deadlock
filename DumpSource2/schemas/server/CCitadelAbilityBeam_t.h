class CCitadelAbilityBeam_t
{
	GameTime_t m_nActivateTime;
	QAngle m_angBeamAngles;
	VectorWS m_vBeamAimPos;
	CHandle< CBaseEntity > m_hShooter;
	CHandle< CCitadelPlayerPawn > m_hPlayerShooter;
	bool m_bEnforceLOSToShootPosition;
	float32 m_flFixedWidth;
	float32 m_flFixedLength;
};
