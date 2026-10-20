// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nurse_Fear_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImmunityModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildupModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GazeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastDelayParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strChannelEndSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bFireFakeBullets;
	float32 m_flFakeBulletsCycleTime;
	float32 m_flFakeBulletSpread; // = 0.7
	// MPropertyDescription = "Height risen over the cast delay. X = cast delay progress [0,1], Y = fraction of LaunchHeight"
	CPiecewiseCurve m_LaunchHeightCurve;
	// MPropertyDescription = "Flat distance she's pushed back, away from her aim, when the scare goes off (inches). 0 = none"
	float32 m_flRecoilDistance;
	// MPropertyDescription = "Time the backwards push takes to cover m_flRecoilDistance (seconds)"
	float32 m_flRecoilDuration;
	// MPropertyDescription = "Distance pushed back over the recoil. X = recoil progress [0,1], Y = fraction of m_flRecoilDistance"
	CPiecewiseCurve m_RecoilDistanceCurve;
};
