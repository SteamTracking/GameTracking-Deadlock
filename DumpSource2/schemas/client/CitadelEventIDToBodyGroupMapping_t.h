// MModelGameData
// MGetKV3ClassDefaults = {
//	"m_mapIDToSettings":
//	{
//	}
//}
// MPropertyFriendlyName = "AG2 Bodygroup Settings"
class CitadelEventIDToBodyGroupMapping_t
{
	// MPropertyDescription = "Maps event IDs to bodygrup settings"
	// MPropertyFriendlyName = "IDs"
	CUtlOrderedMap< CGlobalSymbol, CUtlVector< CitadelBodygroupSetting_t > > m_mapIDToSettings;
};
