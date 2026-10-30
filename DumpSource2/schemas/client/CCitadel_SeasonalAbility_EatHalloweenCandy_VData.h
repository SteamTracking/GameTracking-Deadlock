// MHasKV3TransferPolymorphicClassname
class CCitadel_SeasonalAbility_EatHalloweenCandy_VData : public CitadelCosmeticAbilityVData
{
	// MPropertyStartGroup = "Candy"
	// MPropertyDescription = "Most candy a player can hold. Candy collected past this is wasted. 0 means no limit."
	int32 m_nMaxCandy;
	// MPropertyDescription = "Eating a candy applies one of these to the eater, picked at random"
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_vecCandyModifiers;
	// MPropertyDescription = "Breakable subclasses that throw out this many new candy when a player with this ability breaks them"
	CUtlOrderedMap< CSubclassName< 0 >, int32 > m_mapBreakableCandyDrops;
	// MPropertyDescription = "How far away (in game units) dropped candy lands from whatever dropped it"
	float32 m_flCandyDropDistance; // = 100
};
