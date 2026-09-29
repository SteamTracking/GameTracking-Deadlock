class CMessage : public CPointEntity
{
	CUtlSymbolLarge m_iszMessage;
	float32 m_MessageVolume;
	int32 m_MessageAttenuation;
	float32 m_Radius;
	CGameSoundEventName m_sNoise;
	CEntityIOOutput m_OnShowMessage;
};
