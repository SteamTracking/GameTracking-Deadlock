// MHasKV3TransferPolymorphicClassname
class CAbilityPunkgoatUltVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DiminishingSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FireRateModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VulnerableModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PullToGroundModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BatChargingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHangSound;
	CSoundEventName m_strDiveSound;
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_TimeToReachGroundByHeight;
	CPiecewiseCurve m_GoUpSpeedCurve;
	float32 m_flGoUpDuration;
	float32 m_flGoDownVelocityDampRate;
};
