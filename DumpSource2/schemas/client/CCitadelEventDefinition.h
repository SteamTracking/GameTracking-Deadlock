// MHasKV3TransferPolymorphicClassname
class CCitadelEventDefinition : public CBaseEventDefinition
{
	CUtlOrderedMap< CUtlString, CUtlOrderedMap< CUtlString, float32 > > m_mapBreakablePropVDataOverride;
	CUtlOrderedMap< CUtlString, CitadelEventMapOverrides_t > m_mapMapOverrides;
	CUtlVector< CitadelEventPawnModifier_t > m_vecPlayerPawnModifiers;
};
