class CPlayer_CameraServices : public CPlayerPawnComponent
{
	QAngle m_vecPunchAngle;
	QAngle m_vecPunchAngleVel;
	GameTick_t m_nPunchAngleJoltTick;
	fogplayerparams_t m_PlayerFog;
	CHandle< CColorCorrection > m_hColorCorrectionCtrl;
	CHandle< CBaseEntity > m_hViewEntity;
	CHandle< CTonemapController2 > m_hTonemapController;
	audioparams_t m_audio;
	CNetworkUtlVectorBase< CHandle< CPostProcessingVolume > > m_PostProcessingVolumes;
	float32 m_flOldPlayerZ;
	float32 m_flOldPlayerViewOffsetZ;
	CUtlVector< CHandle< CEnvSoundscapeTriggerable > > m_hTriggerSoundscapeList;
};
