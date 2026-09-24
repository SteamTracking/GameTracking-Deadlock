// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FinishedCondition",
//	"m_option": "FinishedConditionOption_OnFinished",
//	"m_bIsFinished": true
//}
// MPropertyFriendlyName = "Finished Condition"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FinishedCondition : public CAnimGraphDoc_Condition
{
	FinishedConditionOption m_option;
	bool m_bIsFinished;
};
