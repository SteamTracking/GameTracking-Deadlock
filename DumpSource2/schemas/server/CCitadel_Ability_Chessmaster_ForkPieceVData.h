// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chessmaster_ForkPieceVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ForkParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HexModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImmunityModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strForkSound;
	CSoundEventName m_strReflectSound;
	CSoundEventName m_strExpireSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bGrowImmobilizeDurationFromDistance;
	bool m_bOnlyDebuffOnFork;
	bool m_bShouldDropEnemyAura; // = true
	bool m_bShouldDropAllyAura;
	bool m_bAllowMultihitOnReverse;
	float32 m_flDeployGap; // = 10
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flMinPitch;
	float32 m_flMaxPitch; // = 90
	float32 m_flReverseTraceDistance; // = 150
	float32 m_flImmunityDuration; // = 0.3
};
