// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_TagCondition",
//	"m_tagID":
//	{
//		"m_id": 0
//	},
//	"m_comparisonValue": true,
//	"m_latestValue": false
//}
// MPropertyFriendlyName = "Tag Condition"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_TagCondition : public CAnimGraphDoc_Condition
{
	// MPropertyFriendlyName = "Tag"
	// MPropertyAttributeChoiceName = "Tag"
	AnimTagID m_tagID;
	// MPropertyFriendlyName = "Value"
	bool m_comparisonValue;
	// MPropertyFriendlyName = "Lastest Value"
	bool m_latestValue;
};
