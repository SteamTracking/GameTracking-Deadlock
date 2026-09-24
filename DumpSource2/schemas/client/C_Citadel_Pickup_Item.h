// MNetworkVarNames = "AbilityID_t m_unItemID"
// MClassHasEntityLimitedDataDesc
class C_Citadel_Pickup_Item : public C_Citadel_Pickup
{
	// MNetworkEnable
	// MNetworkChangeCallback = "ItemChanged"
	CUtlStringToken m_unItemID;
	CitadelItemVData* m_pItemData;
};
