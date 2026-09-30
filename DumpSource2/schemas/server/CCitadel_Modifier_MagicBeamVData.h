// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MagicBeamVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBeamEndSound;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strTargetLoopingSound;
};
