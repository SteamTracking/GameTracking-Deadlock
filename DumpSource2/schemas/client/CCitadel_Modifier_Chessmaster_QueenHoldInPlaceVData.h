// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Chessmaster_QueenHoldInPlaceVData : public CCitadel_Modifier_StunnedVData
{
	// MPropertyStartGroup = "Gameplay"
	bool m_bDoCheckmate;
	float32 m_flRiseHeight; // = 500
	CPiecewiseCurve m_flSlamCurve;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LiftParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
};
