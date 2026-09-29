// MGetKV3ClassDefaults = {
//	"_class": "CMixAudioSource",
//	"m_name": "",
//	"m_Comment": "",
//	"m_bActive": true,
//	"m_bSolo": false,
//	"m_bEditProperties": false,
//	"m_nGenerationId": 0,
//	"m_kvContainer":
//	{
//		"_class": "CVoiceContainerLoopTrigger",
//		"m_flFadeTime": 0.750000,
//		"m_flRetriggerTimeMin": 1.000000,
//		"m_flRetriggerTimeMax": 3.000000,
//		"m_bCrossFade": false,
//		"m_sound":
//		{
//			"m_bUseReference": true,
//			"m_sound": "sounds/_devonly/weapons/ak47/ak47_mech_04.vsnd"
//		}
//	}
//}
// MPropertyFriendlyName = "VMix Source Audio Node"
// MPropertyDescription = "Plays a vsnd container."
// MHasKV3TransferPolymorphicClassname
class CMixAudioSource : public CMixPropertyBase
{
	KeyValues3 m_kvContainer;
};
