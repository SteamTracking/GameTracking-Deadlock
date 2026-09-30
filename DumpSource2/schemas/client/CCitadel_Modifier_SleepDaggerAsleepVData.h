// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SleepDaggerAsleepVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PostSleepModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PostSleepBulletShredModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PostSleepStaminaModifier;
};
