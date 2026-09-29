// MPropertyArrayElementNameKey = "m_name"
// MVDataAnonymousNode
// MVDataOutlinerNameExpr = "m_name"
// MGetKV3ClassDefaults = {
//	"m_name": "",
//	"m_flSyncPriority": 0.000000,
//	"m_syncStartType": "eSndBeatSyncStartTypeImmediate",
//	"m_syncType": "eSndBeatSyncTypeReset",
//	"m_timeSignature":
//	{
//		"nNumerator": 4,
//		"nDenominator": 4
//	},
//	"m_flLength": 4.000000,
//	"m_bLooping": false,
//	"m_playEventType": "eSndBeatEventTypeBeat",
//	"m_flPlayBeatMult": 1.000000,
//	"m_playKeyType": "eSndBeatPatternTypeKeys",
//	"m_vecPatternKeys":
//	[
//	],
//	"m_vecPatternFloats":
//	[
//	],
//	"m_vecPatternSndEvts":
//	[
//	],
//	"m_vecPatternMidi":
//	[
//	],
//	"m_syncEventType": "eSndBeatEventTypeBeat",
//	"m_flSyncBeatMult": 1.000000,
//	"m_vecSyncPatternKeys":
//	[
//	]
//}
class CSndBeatPattern
{
	// MPropertyFriendlyName = "Pattern Name"
	CUtlString m_name;
	// MPropertyFriendlyName = "Pattern Priority"
	float32 m_flSyncPriority;
	// MPropertyFriendlyName = "Sync Start Type"
	SndBeatSyncStartType_t m_syncStartType;
	// MPropertyFriendlyName = "Sync Type"
	SndBeatSyncType_t m_syncType;
	// MPropertyFriendlyName = "Time Signature"
	SndBeatTimeSignature_t m_timeSignature;
	// MPropertyFriendlyName = "Length (beats)"
	float32 m_flLength;
	// MPropertyFriendlyName = "Looping"
	bool m_bLooping;
	// MPropertyStartGroup = "Playback"
	// MPropertyFriendlyName = "Playback Event Type"
	SndBeatEventType_t m_playEventType;
	// MPropertySuppressExpr = "m_playEventType == eSndBeatEventTypeKeys"
	// MPropertyFriendlyName = "Playback Event Beat/Bar/Phrase/Length Multiplier"
	float32 m_flPlayBeatMult;
	// MPropertySuppressExpr = "m_playEventType != eSndBeatEventTypeKeys"
	// MPropertyFriendlyName = "Key Type"
	SndBeatKeyType_t m_playKeyType;
	// MPropertySuppressExpr = "m_playKeyType != eSndBeatPatternTypeKeys"
	CUtlVector< SndBeatEventKeys_t > m_vecPatternKeys;
	// MPropertySuppressExpr = "m_playKeyType != eSndBeatPatternTypeKeyedFloats"
	CUtlVector< SndBeatEventKeyedFloats_t > m_vecPatternFloats;
	// MPropertySuppressExpr = "m_playKeyType != eSndBeatPatternTypeKeyedSndEvts"
	CUtlVector< SndBeatEventKeyedSndEvts_t > m_vecPatternSndEvts;
	// MPropertySuppressExpr = "m_playKeyType != eSndBeatPatternTypeKeyedMidi"
	CUtlVector< SndBeatEventKeyedMidiNotes_t > m_vecPatternMidi;
	// MPropertyStartGroup = "Queue"
	// MPropertyFriendlyName = "Queue Event Type"
	SndBeatEventType_t m_syncEventType;
	// MPropertySuppressExpr = "m_syncEventType == eSndBeatEventTypeKeys"
	// MPropertyFriendlyName = "Queue Beat/Bar/Phrase/Length Multiplier"
	float32 m_flSyncBeatMult;
	// MPropertySuppressExpr = "m_syncEventType != eSndBeatEventTypeKeys"
	CUtlVector< SndBeatEventKeys_t > m_vecSyncPatternKeys;
};
