// MHasKV3TransferPolymorphicClassname
class CCitadelModifierTier2BossLaserBeamVData : public CCitadelModifierVData
{
	bool m_bIsSideHead;
	float32 m_flSideSearchRadius; // = 1200
	float32 m_flSideSearchAngle; // = 30
	float32 m_flMinShootTime; // = 2
	// MPropertyGroupName = "Visuals"
	CUtlString m_strBeamStartAttachmentPoint;
	CUtlString m_strBeamStartAttachmentPoint02;
	CUtlString m_strBeamStartSearchPos;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamPreviewEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamActiveEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BeamClosestPointLoopSound;
	CSoundEventName m_BeamFireSound;
};
