// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupVData : public CEntitySubclassVDataBase
{
	float32 m_flPhysicsRadius; // = 60
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	// MPropertyGroupName = "Music"
	CitadelMusicMsgType m_nSpawnMusicState; // = "k_EMusicQueue_Invalid"
};
