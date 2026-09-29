// MGetKV3ClassDefaults = {
//	"_class": "CNmContactEvent",
//	"m_flStartTime":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_flDuration":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_syncID": "",
//	"m_attachmentOrBoneID": "",
//	"m_audioInfo":
//	{
//		"m_audioActionID": "",
//		"m_audioTypeID": "",
//		"m_soundeventOverrideID": ""
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNmContactEvent : public CNmEvent
{
	CGlobalSymbol m_attachmentOrBoneID;
	NmContactAudioInfo_t m_audioInfo;
};
