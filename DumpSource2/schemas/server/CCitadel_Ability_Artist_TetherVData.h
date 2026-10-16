// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_TetherVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTetherHitConfirmSound;
	CSoundEventName m_strFailSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuildupModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StunModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SuccessModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinimumCancelDelay; // = 0.15
	bool m_bBuildupRequiresLook;
	bool m_bBuildupRequiresRange;
	bool m_bBuildupRequiresLOS;
	bool m_bShouldVOOnProc;
	bool m_bShouldDropPickupOnproc;
	bool m_bShouldUseProjectiles;
	float32 m_flBuildupGracePeriod; // = 0.25
	bool m_bUseDesatVolumes;
	Color aimColorDesat; // = [ 150, 207, 184 ]
	Color aimColorSat; // = [ 255, 255, 255 ]
	Color aimColorOutline; // = [ 150, 207, 184, 0 ]
	float32 m_flSatVolumeInnerConeSize; // = 0.5
	CPiecewiseCurve m_flSatVolumeConeCurve;
	float32 m_flMashProtectionTime; // = 0.4
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strAG2HeroActionPostCastSuccess; // = "postcast_success"
	CGlobalSymbol m_strAG2HeroActionPostCastFail; // = "postcast_fail"
};
