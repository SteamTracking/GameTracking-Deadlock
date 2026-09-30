// MHasKV3TransferPolymorphicClassname
class CCitadel_FissureWallVData : public CEntitySubclassVDataBase
{
	int32 m_nMeleeHits; // = 4
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_HitSound;
	CSoundEventName m_DestroySound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
};
