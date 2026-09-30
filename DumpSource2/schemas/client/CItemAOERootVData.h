// MHasKV3TransferPolymorphicClassname
class CItemAOERootVData : public CitadelItemVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strRootTargetSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TetherModifier;
};
