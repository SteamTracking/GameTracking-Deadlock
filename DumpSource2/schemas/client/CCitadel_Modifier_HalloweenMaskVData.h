// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_HalloweenMaskVData : public CCitadelModifierVData
{
	int32 m_nNumMasks;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HalloweenMask;
	// MPropertyStartGroup = "Overrides"
	CUtlOrderedMap< CUtlString, Vector > m_HeroOffsets;
};
