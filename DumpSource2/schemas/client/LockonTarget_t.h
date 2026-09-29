class LockonTarget_t
{
	float32 m_flGainRate;
	float32 m_flDrainRate;
	float32 m_flMaxValue;
	int32 m_nPrevFullStacks;
	float32 m_flLatchedValue;
	GameTime_t m_flLatchedTime;
	ELockonState m_eLockonState;
	CHandle< C_BaseEntity > m_hTarget;
};
