// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Baba_BenchRun_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLightKickSound;
	CSoundEventName m_strHeavyKickSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HeavyKickSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundPoundFallModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LightKickShoveModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flUpwardsForceOnHeavyMeleeStart;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BenchRunEndParticle;
};
