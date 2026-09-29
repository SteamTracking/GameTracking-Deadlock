// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_BodyGroup",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_target": "Self",
//	"m_bodygroup": "",
//	"m_choice": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_BodyGroup : public CNmClipDocEvent
{
	CNmEventTargetEntity_t m_target;
	// MPropertyFriendlyName = "Body Group"
	CUtlString m_bodygroup;
	// MPropertyFriendlyName = "Choice Name"
	CUtlString m_choice;
};
