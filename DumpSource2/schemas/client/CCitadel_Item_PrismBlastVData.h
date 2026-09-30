// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_PrismBlastVData : public CCitadel_Item_BubbleVData
{
	float32 m_flBeamRotateSpeed; // = 30
	float32 m_flTickRate; // = 0.1
	float32 m_flOscilateRate; // = 10
	float32 m_flOscilateMaxPitch; // = 10
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticleLocal;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamHitParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strLaserLoopSound;
};
