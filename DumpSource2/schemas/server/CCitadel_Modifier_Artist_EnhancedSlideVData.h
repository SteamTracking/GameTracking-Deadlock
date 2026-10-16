// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_EnhancedSlideVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strSlidingLoopingSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SlideParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DamageAmpModifier;
	// MPropertyStartGroup = "Gameplay"
	bool m_bOnlyBonusDuringSlide;
	bool m_bDoCatchupSpeed;
	bool m_bAllowSlideDashJump;
	CPiecewiseCurve m_flCatchupSpeedCurve;
};
