class BreakablePropCurrencyReward_t
{
	// MPropertyDescription = "How much of this currency each recipient is granted"
	int32 m_nAmount;
	// MPropertyDescription = "If set, one of these citadel_pickup_currency pickups is dropped for players to collect instead of the currency being granted the instant the prop breaks."
	CSubclassName< 0 > m_sCurrencyPickup;
};
