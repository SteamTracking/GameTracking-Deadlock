// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_Contact",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_attachmentOrBoneID": "",
//	"m_audioInfo":
//	{
//		"m_audioActionID": "",
//		"m_audioTypeID": "",
//		"m_soundeventOverrideID": ""
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_Contact : public CNmClipDocEvent
{
	CGlobalSymbol m_attachmentOrBoneID;
	// MPropertyFriendlyName = "Audio"
	NmContactAudioInfo_t m_audioInfo;
};
