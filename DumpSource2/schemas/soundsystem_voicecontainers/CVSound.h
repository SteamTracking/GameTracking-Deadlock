// MGetKV3ClassDefaults = {
//	"m_Sentences":
//	[
//	],
//	"m_nRate": 0,
//	"m_nFormat": "PCM16",
//	"m_nChannels": 0,
//	"m_nLoopStart": 0,
//	"m_nSampleCount": 0,
//	"m_flDuration": 0.000000,
//	"m_nStreamingSize": 0,
//	"m_nLoopEnd": 0
//}
class CVSound
{
	CUtlLeanVector< CAudioSentence > m_Sentences;
	int32 m_nRate;
	CVSoundFormat_t m_nFormat;
	uint32 m_nChannels;
	int32 m_nLoopStart;
	uint32 m_nSampleCount;
	float32 m_flDuration;
	uint32 m_nStreamingSize;
	int32 m_nLoopEnd;
};
