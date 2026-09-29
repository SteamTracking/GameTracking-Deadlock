// MGetKV3ClassDefaults = {
//	"_class": "CNmClothEvent",
//	"m_flStartTime":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_flDuration":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_syncID": "",
//	"m_type": "Stiffen",
//	"m_flStiffness": 1.000000,
//	"m_flSpeedIn": 10.000000,
//	"m_flSpeedOut": 10.000000,
//	"m_flLengthSeconds": 1.000000,
//	"m_vertexSetName": "",
//	"m_effectName": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNmClothEvent : public CNmEvent
{
	CNmClothEvent::Type_t m_type;
	float32 m_flStiffness;
	float32 m_flSpeedIn;
	float32 m_flSpeedOut;
	float32 m_flLengthSeconds;
	CUtlString m_vertexSetName;
	CUtlString m_effectName;
};
