// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chessmaster_MoveChessPieceVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	CUtlOrderedMap< EChessPieceType, CSubclassName< 4 > > m_mapChessAbilities;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_MoveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveAllyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveKingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveQueenModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CooldownModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CooldownPlayerModifier;
	// MPropertyStartGroup = "Visuals"
	Color m_cHoverOutlineColor;
	float32 m_flHoverOutlineWidth;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetHoverParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewBishopParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewAllyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewQueenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewKingParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strMoveBishopSound;
	CSoundEventName m_strMoveKnightSound;
	CSoundEventName m_strMoveQueenSound;
	CSoundEventName m_strMoveKingSound;
	CSoundEventName m_strSelectPieceSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHoverTime; // = 3
	float32 m_flPassiveTargetingConeAngle; // = 40
	float32 m_flPassiveTargetingHalfWidth; // = 40
	float32 m_flPassiveTargetingNearbyCasterRadius; // = 100
	float32 m_flPassiveTargetingNearbyCrosshairRadius; // = 100
	float32 m_flSpawnPositionNavMeshSearchRange; // = 100
	bool m_bCreateSatVolume;
	bool m_bMoveAllFixedDistance;
	bool m_bSweepToDestination;
	bool m_bDebug;
	CUtlVector< Class_T > m_vecPossibleClasses;
};
