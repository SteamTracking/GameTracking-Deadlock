// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Deadpack_UltimateVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChargingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GoingUpModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GoingDownModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	// MPropertyStartGroup = "Sounds"
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_strGoingUpSounds;
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_strGoingDownSounds;
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Camera Shake"
	float32 m_flShakeAmp; // = 5
	float32 m_flShakeFreq; // = 5
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_flGoingUpSpeedOverTime;
	CPiecewiseCurve m_flGoingDownSpeedOverTime;
	CPiecewiseCurve m_flApexSpeedByDistance;
	float32 m_flLateralSpeedGoingUp;
	float32 m_flLateralSpeedGoingDown;
	float32 m_flChargeTime; // = 1
	float32 m_flGrabDistance; // = 50
	float32 m_flCameraTurnRateMax; // = 10
	float32 m_flSpinRateGoingDownDegreesPerSec; // = 90
	float32 m_flMaxPossibleFlyHeight; // = 1700
};
