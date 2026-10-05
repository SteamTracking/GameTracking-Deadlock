// MHasKV3TransferPolymorphicClassname
class CBaseTieredLockonAbilityVData : public CBaseLockonAbilityVData
{
	// MPropertyStartGroup = "Lockon"
	// MPropertyDescription = "How long each lockon stack takes to gain, in order. The number of entries is the max number of stacks. When the TimeToMaxStacks property is above 0 these are relative weights scaled to sum to it."
	CUtlVector< float32 > m_vecLockonStackDurations;
};
