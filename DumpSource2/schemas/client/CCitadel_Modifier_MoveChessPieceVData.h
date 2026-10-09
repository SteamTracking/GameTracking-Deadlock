// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MoveChessPieceVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HoverParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BishopPathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AdditionalPathParticle;
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_MovementCurve;
	CPiecewiseCurve m_VerticalOffsetCurve;
	CPiecewiseCurve m_LeanCurve;
	bool m_bDebug;
	bool m_bMoveOnRightTriangle;
	bool m_bMoveOnDiagonal;
	bool m_bImmuneDuringMove;
	bool m_bTryToGroundDuring;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLandingSound;
};
