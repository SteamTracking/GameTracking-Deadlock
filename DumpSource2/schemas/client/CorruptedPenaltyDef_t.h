// MPropertyArrayElementNameKey = "m_strName"
class CorruptedPenaltyDef_t
{
	CUtlString m_strName;
	// MPropertyDescription = "Relative chance of being rolled.  0 = never rolled."
	float32 m_flRollWeight; // = 1
	// MPropertyDescription = "Effects applied together when this penalty is rolled."
	CUtlVector< CorruptedPenaltyEffect_t > m_vecEffects;
};
