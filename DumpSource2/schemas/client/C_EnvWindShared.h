// MGetKV3ClassDefaults = {
//	"_class": "C_EnvWindShared",
//	"m_iMinWind": 0,
//	"m_iMaxWind": 0,
//	"m_windRadius": 0,
//	"m_iMinGust": 0,
//	"m_iMaxGust": 0,
//	"m_flMinGustDelay": 0.000000,
//	"m_flMaxGustDelay": 0.000000,
//	"m_flGustDuration": 0.000000,
//	"m_iGustDirChange": 0
//}
// MHasKV3TransferPolymorphicClassname
class C_EnvWindShared
{
	// MNotSaved
	GameTime_t m_flStartTime;
	// MNotSaved
	uint32 m_iWindSeed;
	uint16 m_iMinWind;
	uint16 m_iMaxWind;
	int32 m_windRadius;
	uint16 m_iMinGust;
	uint16 m_iMaxGust;
	float32 m_flMinGustDelay;
	float32 m_flMaxGustDelay;
	float32 m_flGustDuration;
	uint16 m_iGustDirChange;
	// MNotSaved
	uint16 m_iInitialWindDir;
	// MNotSaved
	float32 m_flInitialWindSpeed;
	// MNotSaved
	VectorWS m_location;
	// MNotSaved
	CHandle< C_BaseEntity > m_hEntOwner;
};
