// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_Cloth",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_type": "Stiffen",
//	"m_flStiffness": 1.000000,
//	"m_flSpeedIn": 10.000000,
//	"m_flSpeedOut": 10.000000,
//	"m_flLengthSeconds": 1.000000,
//	"m_vertexSetName": "",
//	"m_effectName": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_Cloth : public CNmClipDocEvent
{
	// MPropertyAutoRebuildOnChange
	CNmClothEvent::Type_t m_type;
	// MPropertyAttrStateCallback
	float32 m_flStiffness;
	// MPropertyAttrStateCallback
	float32 m_flSpeedIn;
	// MPropertyAttrStateCallback
	float32 m_flSpeedOut;
	// MPropertyAttrStateCallback
	float32 m_flLengthSeconds;
	// MPropertyAttrStateCallback
	CUtlString m_vertexSetName;
	// MPropertyAttrStateCallback
	CUtlString m_effectName;
};
