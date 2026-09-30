// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bull_LeapVData : public CitadelAbilityVData
{
	CPiecewiseCurve m_CrashSpeedScaleCurve;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BoostModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CrashModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImmunityModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LandingBonusesModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DragModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TakeOffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HoverParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DivingPreviewParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCrashingSound;
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flStartupTime; // = 0.2
	float32 m_flForwardBoostSpeed; // = 625
	float32 m_flUpBoostSpeed; // = 850
	float32 m_flBoostTurnRate; // = 30
	float32 m_flHoverTime;
	float32 m_flMinAimAngle; // = 30
	float32 m_flBoostGain; // = 0.1
	float32 m_flBoostTime; // = 1.5
	float32 m_flLandingTime; // = 0.2
	float32 m_flCrashSpeed; // = 2200
	float32 m_flCrashBraceAnimTime; // = 0.25
	float32 m_flCollideRadius; // = 160
	float32 m_flHoverInputSpeedMax; // = 200
	float32 m_flHoverInputAcceleration; // = 20
	float32 m_flHoverSpeedDecay; // = 0.9
	float32 m_flCrashDownInputBuffer; // = 0.5
};
