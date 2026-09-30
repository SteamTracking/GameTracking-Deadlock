// MHasKV3TransferPolymorphicClassname
class CCitadel_Bounce_PadVData : public CEntitySubclassVDataBase
{
	float32 m_flBouncePadCollisionHeight; // = 16
	float32 m_flBouncePadCollisionRadius; // = 25
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IdleParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCasterBounceSound;
	CSoundEventName m_strOtherHeroBounceSound;
	CSoundEventName m_strBarrelBounceSound;
	CSoundEventName m_strExpiredSound;
};
