// MGetKV3ClassDefaults = {
//	"_class": "CBodyGroupAnimTag",
//	"m_name": "Unnamed Tag",
//	"m_sComment": "",
//	"m_group": "",
//	"m_tagID":
//	{
//		"m_id": 0
//	},
//	"m_bIsReferenced": false,
//	"m_nPriority": 5,
//	"m_bodyGroupSettings":
//	[
//	]
//}
// MPropertyFriendlyName = "Body Group Tag"
// MHasKV3TransferPolymorphicClassname
class CBodyGroupAnimTag : public CAnimTagBase
{
	// MPropertyFriendlyName = "Priority"
	int32 m_nPriority;
	// MPropertyFriendlyName = "Body Group Settings"
	CUtlVector< CBodyGroupSetting > m_bodyGroupSettings;
};
