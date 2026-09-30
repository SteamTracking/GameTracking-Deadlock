// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityHealingSlashVData : public CCitadelYamatoBaseVData
{
	float32 m_flEffectSize; // = 20
	float32 m_flMaxAttackAngle; // = 90
	CRemapFloat m_remapAngleToTime;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	CEmbeddedSubclass< CBaseModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingSlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingSlashSwordGlow;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
};
