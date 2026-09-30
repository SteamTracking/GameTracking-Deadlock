// MHasKV3TransferPolymorphicClassname
class CCitadel_Pickup_Gold_VData : public CCitadel_Pickup_VData
{
	float32 m_flGoldAmount;
	float32 m_flGoldPerMinuteAmount;
	// MPropertyDescription = "When false, this pickup shows no in-world panel at all - no reward amount and no name."
	bool m_bUseLabelPanel; // = true
};
