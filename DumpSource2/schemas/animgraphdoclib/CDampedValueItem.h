// MGetKV3ClassDefaults = {
//	"m_valueType": "FloatParameter",
//	"m_floatParamNameIn": "",
//	"m_floatParamNameOut": "",
//	"m_vectorParamNameIn": "",
//	"m_vectorParamNameOut": "",
//	"m_floatParamIn":
//	{
//		"m_id": 0
//	},
//	"m_floatParamOut":
//	{
//		"m_id": 0
//	},
//	"m_vectorParamIn":
//	{
//		"m_id": 0
//	},
//	"m_vectorParamOut":
//	{
//		"m_id": 0
//	},
//	"m_damping":
//	{
//		"_class": "CAnimInputDamping",
//		"m_speedFunction": "NoDamping",
//		"m_fSpeedScale": 1.000000,
//		"m_fFallingSpeedScale": 1.000000
//	}
//}
// MPropertyFriendlyName = "Damped Value"
class CDampedValueItem
{
	// MPropertyFriendlyName = "Value Type"
	// MPropertyAutoRebuildOnChange
	DampedValueType m_valueType;
	// MPropertySuppressField
	CUtlString m_floatParamNameIn;
	// MPropertySuppressField
	CUtlString m_floatParamNameOut;
	// MPropertySuppressField
	CUtlString m_vectorParamNameIn;
	// MPropertySuppressField
	CUtlString m_vectorParamNameOut;
	// MPropertyFriendlyName = "Parameter In"
	// MPropertyAttributeChoiceName = "FloatParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_floatParamIn;
	// MPropertyFriendlyName = "Parameter Out"
	// MPropertyAttributeChoiceName = "PrivateFloatParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_floatParamOut;
	// MPropertyFriendlyName = "Parameter In"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_vectorParamIn;
	// MPropertyFriendlyName = "Parameter Out"
	// MPropertyAttributeChoiceName = "PrivateVectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_vectorParamOut;
	// MPropertyFriendlyName = "Damping"
	CAnimInputDamping m_damping;
};
