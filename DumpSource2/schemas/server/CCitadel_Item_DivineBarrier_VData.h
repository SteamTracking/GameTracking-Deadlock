// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_DivineBarrier_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DivineBarrierModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPurgeSound;
};
