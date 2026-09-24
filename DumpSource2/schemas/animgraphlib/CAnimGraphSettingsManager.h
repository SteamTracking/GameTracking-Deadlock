// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphSettingsManager",
//	"m_settingsGroups":
//	[
//		{
//			"_class": "CAnimGraphNetworkSettings",
//			"m_bNetworkingEnabled": true
//		}
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CAnimGraphSettingsManager
{
	CUtlVector< CSmartPtr< CAnimGraphSettingsGroup > > m_settingsGroups;
};
