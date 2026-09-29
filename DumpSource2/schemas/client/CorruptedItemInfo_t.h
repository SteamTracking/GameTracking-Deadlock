// MGetKV3ClassDefaults = {
//	"m_nSoulCostOverride": -1,
//	"m_Upgrade":
//	{
//		"m_vecPropertyUpgrades":
//		[
//		]
//	},
//	"m_vecIntrinsicModifiers":
//	[
//	],
//	"m_vecExcludedPenalties":
//	[
//	]
//}
class CorruptedItemInfo_t
{
	// MPropertyDescription = "Souls charged to corrupt this item.  If <= 0, the price for this item's tier from generic_data is used."
	int32 m_nSoulCostOverride;
	// MPropertyDescription = "Stat changes layered on top of the base item once it has been corrupted."
	// MPropertyAutoExpandSelf
	AbilityUpgrade_t m_Upgrade;
	// MPropertyDescription = "Extra intrinsic modifiers granted only while the item is corrupted."
	CUtlVector< CEmbeddedSubclass< CBaseModifier > > m_vecIntrinsicModifiers;
	// MPropertyDescription = "Names of corrupted penalties from generic_data's m_vecCorruptedPenaltyDefs that this item can never roll."
	CUtlVector< CUtlString > m_vecExcludedPenalties;
};
