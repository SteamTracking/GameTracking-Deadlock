// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_MaulingLeapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Motion"
	CPiecewiseCurve m_LeapingSpeedCurve;
	CPiecewiseCurve m_LeapingUpCurve;
	float32 m_flVelocityCarryoverOnHit; // = -0.05
	float32 m_flVelocityCarryoverOnMiss; // = 0.33
	float32 m_flFracToAllowUp; // = 0.33
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LeapHitImpact;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_UltLeapCastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_LeapHitSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LeapingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strAG2SuccessHeroState; // = "ability_mauling_leap_success"
};
