class CGunTarget : public CBaseToggle
{
	float32 m_flSpeed;
	bool m_on;
	CHandle< CBaseEntity > m_hTargetEnt;
	CEntityIOOutput m_OnDeath;
};
