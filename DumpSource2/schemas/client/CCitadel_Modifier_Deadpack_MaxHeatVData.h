// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Deadpack_MaxHeatVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_OverheatLaunchModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OverheatAirToBackflipModifier;
	CEmbeddedSubclass< CCitadelModifier > m_JetpackLockoutModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flLaunchAngleRandom; // = 45
	float32 m_flLaunchZFractionWhenFlyingSelf; // = 0.15
	CRangeFloat m_flLaunchForce;
	CRangeFloat m_flLaunchForceSelf;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StunTriggeredParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strExplodeSound;
};
