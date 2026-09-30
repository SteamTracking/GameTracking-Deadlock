// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_LeapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCrashSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LeapingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LandingBonusesModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CrashParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flBufferTimeBeforeLanding; // = 0.2
	float32 m_flMaxPitch; // = 90
	float32 m_flMinPitch; // = 30
	CPiecewiseCurve m_LeapSpeedCurve;
};
