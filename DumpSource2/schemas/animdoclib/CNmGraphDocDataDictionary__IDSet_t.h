// MGetKV3ClassDefaults = {
//	"m_ID": "",
//	"m_name": "",
//	"m_graphIDs":
//	[
//	]
//}
// MPropertyAutoExpandSelf
class CNmGraphDocDataDictionary::IDSet_t
{
	// MPropertySuppressField
	V_uuid_t m_ID;
	// MPropertyFlattenIntoParentRow
	CUtlString m_name;
	// MPropertyAutoExpandSelf
	// MPropertyFriendlyName = "Graph IDs"
	CUtlVector< CGlobalSymbol > m_graphIDs;
};
