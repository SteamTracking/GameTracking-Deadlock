// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupVData : public CEntitySubclassVDataBase
{
	float32 m_flPhysicsRadius; // = 60
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	Color m_OutlineColor; // = [ 255, 255, 0 ]
	bool m_bPanelShowThruWalls;
	// MPropertyGroupName = "Music"
	CitadelMusicMsgType m_nSpawnMusicState; // = "k_EMusicQueue_Invalid"
};
