// MPropertyArrayElementNameKey = "m_name"
// MVDataAnonymousNode
// MVDataOutlinerNameExpr = "m_name"
// MGetKV3ClassDefaults = {
//	"m_name": "",
//	"m_playbackType": "eSndBeatTrackPlaybackTypeFwd",
//	"m_nTranspose": 0,
//	"m_bSyncToVoice": false,
//	"m_flBPM": 120.000000
//}
class CSndBeatTrack
{
	// MPropertyFriendlyName = "Track Name"
	CUtlString m_name;
	// MPropertyFriendlyName = "Playback Mode"
	SndBeatTrackPlaybackType_t m_playbackType;
	// MPropertyFriendlyName = "Transpose"
	int32 m_nTranspose;
	// MPropertyFriendlyName = "Sync To Voice"
	bool m_bSyncToVoice;
	// MPropertyFriendlyName = "BPM"
	float32 m_flBPM;
};
