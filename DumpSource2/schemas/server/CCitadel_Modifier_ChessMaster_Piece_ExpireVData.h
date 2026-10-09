// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ChessMaster_Piece_ExpireVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	bool m_bExpireOverTime; // = true
	bool m_bExpireFromDistanceToCaster;
	bool m_bExpireWhenCasterDies;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MoveAvailableParticle;
};
