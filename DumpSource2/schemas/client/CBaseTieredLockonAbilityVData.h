// MHasKV3TransferPolymorphicClassname
class CBaseTieredLockonAbilityVData : public CBaseLockonAbilityVData
{
	// MPropertyStartGroup = "Lockon"
	// MPropertyDescription = "How long each lockon stack takes to gain, in order. The number of entries is the max number of stacks."
	CUtlVector< float32 > m_vecLockonStackDurations;
};
