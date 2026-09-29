class CFuncTrackTrain : public CBaseModelEntity
{
	CHandle< CPathTrack > m_ppath;
	float32 m_length;
	Vector m_vPosPrev;
	QAngle m_angPrev;
	float32 m_flSpeed;
	Vector m_controlMins;
	Vector m_controlMaxs;
	// MNotSaved
	VectorWS m_lastBlockPos;
	// MNotSaved
	int32 m_lastBlockTick;
	float32 m_flVolume;
	float32 m_flBank;
	float32 m_oldSpeed;
	float32 m_flBlockDamage;
	float32 m_height;
	float32 m_maxSpeed;
	float32 m_dir;
	CGameSoundEventName m_iszSoundMove;
	CGameSoundEventName m_iszSoundMovePing;
	CGameSoundEventName m_iszSoundStart;
	CGameSoundEventName m_iszSoundStop;
	CGameSoundEventName m_strPathTarget;
	float32 m_flMoveSoundMinDuration;
	float32 m_flMoveSoundMaxDuration;
	GameTime_t m_flNextMoveSoundTime;
	float32 m_flMoveSoundMinPitch;
	float32 m_flMoveSoundMaxPitch;
	TrainOrientationType_t m_eOrientationType;
	TrainVelocityType_t m_eVelocityType;
	CEntityIOOutput m_OnStart;
	CEntityIOOutput m_OnNext;
	CEntityIOOutput m_OnArrivedAtDestinationNode;
	bool m_bManualSpeedChanges;
	// MNotSaved
	float32 m_flDesiredSpeed;
	// MNotSaved
	GameTime_t m_flSpeedChangeTime;
	float32 m_flAccelSpeed;
	float32 m_flDecelSpeed;
	// MNotSaved
	bool m_bAccelToSpeed;
	// MNotSaved
	GameTime_t m_flNextMPSoundTime;
};
