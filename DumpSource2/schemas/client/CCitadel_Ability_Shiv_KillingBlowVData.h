// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Shiv_KillingBlowVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LeapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ActiveBuff;
	CEmbeddedSubclass< CCitadelModifier > m_KillableModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RecastWindowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RageDrainSuppressedModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AttackParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KillingBlowCastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_OnKillSound;
	// MPropertyStartGroup = "+Killing Blow Params"
	float32 m_flKillableGlowRange; // = 1000
	float32 m_flGlowMinTime; // = 0.1
	float32 m_flFracToAllowUp; // = 0.33
	float32 m_flMinLeapTime; // = 0.25
	float32 m_flCheckRadius; // = 70
	float32 m_flSlashRadius; // = 200
	float32 m_flRefreshLockOutTime; // = 0.25
	float32 m_flMaxTurnRate; // = 140
	float32 m_flCameraTurnRate; // = 200
	CPiecewiseCurve m_SpeedCurve;
	CPiecewiseCurve m_SpeedUpCurve;
	float32 m_flVelocityCarryoverOnMiss; // = 0.33
};
