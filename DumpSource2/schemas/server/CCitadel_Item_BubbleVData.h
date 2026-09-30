// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_BubbleVData : public CitadelItemVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_CastTargetSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BubbleModifier;
};
