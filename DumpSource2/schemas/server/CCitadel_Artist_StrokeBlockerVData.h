// MHasKV3TransferPolymorphicClassname
class CCitadel_Artist_StrokeBlockerVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Gameplay"
	int32 m_nMeleeHits; // = 1
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	CSoundEventName m_strDestroySound;
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_mapLoopSounds;
	// MPropertyStartGroup = "Visuals"
	bool m_bBlockerIsVisible;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
};
