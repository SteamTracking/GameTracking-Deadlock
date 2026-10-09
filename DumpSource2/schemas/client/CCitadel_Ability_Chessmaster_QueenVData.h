// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chessmaster_QueenVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LiftModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TileModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TileExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PostExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AOEExplodeSound;
	CSoundEventName m_strAOEWarningSound;
	CSoundEventName m_strExpireSound;
	CSoundEventName m_QueenRecallSound;
	CSoundEventName m_QueenExpireSound;
	CSoundEventName m_strCheckmateSound;
	CSoundEventName m_strTileReleasedSound;
	CSoundEventName m_strSlamSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bOrientToWorldForward;
	bool m_bHaveLinesStun;
	bool m_bOnlyStunOnce; // = true
	bool m_bOnlyStunThreat;
	bool m_bDoLiftOnStun;
	bool m_bDamageBeforeLift;
	bool m_bHasLimitedMoves;
	float32 m_flInitialTileDelay; // = 0.3
	float32 m_flTimeBetweenTiles; // = 0.1
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flSinclairModelSwapHold; // = 1.1
};
