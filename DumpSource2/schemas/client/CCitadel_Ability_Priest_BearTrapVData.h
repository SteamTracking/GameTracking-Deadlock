// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_BearTrapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ArmedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExpiredSound;
	CSoundEventName m_strDestroyedSound;
	CSoundEventName m_strArmSound;
	CSoundEventName m_strProjBounceSound;
	CSoundEventName m_strProjThrowLoopSound;
	CSoundEventName m_strProjArmedLoopSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TetherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UntargetableModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flVerticalSpawnOffset; // = -5
	float32 m_flHorizontalSpawnOffset;
	float32 m_flDropDownRate;
	float32 m_flClimbHeight;
	float32 m_flDistanceAboveGround;
	float32 m_flDeceleration; // = 10
	float32 m_flMinSpeedToArm; // = 1
	float32 m_flReflectSpeedReductionRatio; // = 0.5
	float32 m_flGroundYawSpeedRatio; // = 0.5
	float32 m_flAirYawSpeedRatio; // = 0.5
	float32 m_flAirPitchSpeedRatio; // = 0.5
	float32 m_flAirRollSpeedRatio; // = 0.5
};
