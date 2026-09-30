class RejuvinatorParams_t
{
	float32 m_flRejuvinatorExpirationWarningTiming; // = 30
	float32 m_flRejuvinatorBuffDuration; // = 240
	float32 m_flRejuvinatorDropHeight; // = 500
	float32 m_flRejuvinatorDropDuration; // = 7
	float32[3] m_flRejuvinatorRebirthDuration;
	CUtlVector< float32 > m_TrooperHealthMult;
	CUtlVector< float32 > m_PlayerRespawnMult;
	CSoundEventName m_strRejuvPickupSound;
};
