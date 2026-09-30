class BreakablePowerupLootParams_t
{
	// MPropertyDescription = "How many times each entry should be in the 'card deck'"
	int32 m_iLootListDeckSize; // = 1
	// MPropertyDescription = "Rewards keyed by the match time in minutes they start dropping at. Each set stays in use until the next set's match time is reached."
	CUtlOrderedMap< int32, CUtlOrderedMap< CSubclassName< 0 >, float32 > > m_mapPickupsByMatchTimeMins;
};
