// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Chessmaster_MovingPieceDamageVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDropGroundAuras;
	bool m_bAlignOnDiagonal;
};
