// MHasKV3TransferPolymorphicClassname
class CCitadel_Pickup_Currency_VData : public CCitadel_Pickup_VData
{
	// MPropertyStartGroup = "Currency"
	ECurrencyType m_Currency; // = "EGold"
	bool m_bPlayCurrencySound; // = true
	CUtlString m_strLabelName;
};
