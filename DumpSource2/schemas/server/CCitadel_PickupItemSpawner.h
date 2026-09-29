class CCitadel_PickupItemSpawner : public CBaseAnimGraph
{
	GameTime_t m_tNextDropTime;
	GameTime_t m_tNextPingTime;
	bool m_bPingedPowerup;
	bool m_bPowerupActive;
};
