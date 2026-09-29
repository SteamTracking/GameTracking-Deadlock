class CCitadelTriggerCapturePoint : public C_BaseTrigger
{
	CCitadelInWorldEventTimer* m_pUIWorldEventTimer;
	GameTime_t m_tQueuedEnableTime;
	float32 m_flCaptureProgress;
	int32 m_nCaptureProgressOwner;
	int32 m_nActivelyCapturingTeam;
	int32 m_nActiveCapturers;
	uint8 m_nEnableState;
};
