// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Magician_AnimalCurseVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CurseModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AirDampingModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetWarningSound;
	CSoundEventName m_ProjectileHitConfirm;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProjectileImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetWarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProjectileExplodeParticle;
};
