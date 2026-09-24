// MGetKV3ClassDefaults = {
//	"m_ID": "",
//	"m_name": "",
//	"m_groupName": "",
//	"m_valueType": "ID",
//	"m_expectedValues":
//	[
//	]
//}
// MPropertyAutoExpandSelf
class CNmGraphDocDataDictionary::Parameter_t
{
	// MPropertySuppressField
	V_uuid_t m_ID;
	CUtlString m_name;
	CUtlString m_groupName;
	NmGraphValueType_t m_valueType;
	// MPropertyAutoExpandSelf
	// MPropertyAttrStateCallback
	CUtlVector< CGlobalSymbol > m_expectedValues;
};
