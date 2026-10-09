// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chessmaster_ThrowBishopVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SummonModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StackingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ExpireModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BlackPieceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BishopSpawnSound;
	CSoundEventName m_BishopRecallSound;
	CSoundEventName m_strBishopExpireSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldCreateEnemyAura;
	bool m_bExpireOverTime;
	bool m_bDebugTrace;
	bool m_bShouldApplySlowOnImpact; // = true
	EChessPieceType m_eChessPieceType; // = "kChessPiece_Type_None"
	float32 m_flRecallOnMeleeRange; // = 400
	float32 m_flCylinderTraceRadius; // = 15
	float32 m_flCylinderTraceLength; // = 1000
	float32 m_flPopUpSpeed; // = 50
	float32 m_flVerticalOffset;
};
