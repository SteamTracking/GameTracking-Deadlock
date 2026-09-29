class CCitadelAbilityBeam_t
{
	GameTime_t m_nActivateTime;
	QAngle m_angBeamAngles;
	VectorWS m_vBeamAimPos;
	bool m_bNeedsBeamReset;
	CHandle< C_BaseEntity > m_hShooter;
	CHandle< C_CitadelPlayerPawn > m_hPlayerShooter;
	bool m_bEnforceLOSToShootPosition;
	float32 m_flFixedWidth;
	float32 m_flFixedLength;
};
