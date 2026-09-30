// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VampireBat_BatSwarmVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GainedBatParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BatSwarmChannelParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strFireBatSound;
	CSoundEventName m_strGainedBatSound;
	CSoundEventName m_strChannelEndSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bAllowLockOn;
	bool m_bAllowSatVolume;
	bool m_bAllowRetarget;
	float32 m_flBatTickRate; // = 0.1
	float32 m_flBatLifetime; // = 5
	float32 m_flTrackingAngularStrengthMin; // = 0.1
	float32 m_flTrackingAngularStrengthMax; // = 0.1
	float32 m_flBatRetargetRadius; // = 100
	float32 m_flCurlNoiseStrength; // = 1
	float32 m_flCurlNoiseMinFrequency; // = 0.1
	float32 m_flCurlNoiseMaxFrequency; // = 1
	CPiecewiseCurve m_DistanceToAccuracyCurve;
	CPiecewiseCurve m_SatVolumeCastDelayRadiusCurve;
	Color aimColorDesat; // = [ 150, 207, 184 ]
	Color aimColorSat; // = [ 255, 255, 255 ]
	Color aimColorOutline; // = [ 150, 207, 184 ]
	float32 m_flSatVolumePulsePerBat; // = 0.5
	float32 m_flSatVolumeInnerConeSize; // = 0.5
	float32 m_flLowTickRateDistCheck; // = 60
};
