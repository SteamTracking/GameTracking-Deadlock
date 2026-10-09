// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Chessmaster_DamageAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldDamageOnAura;
	bool m_bShouldPulseOnAuraCreation;
	bool m_bShouldPulseOnlyOffCooldown;
	float32 m_flPulseDelay; // = 0.2
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaserParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PulseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBeamLoopStartSound;
	CSoundEventName m_strBeamLoopSound;
	CSoundEventName m_strBeamHitSound;
};
