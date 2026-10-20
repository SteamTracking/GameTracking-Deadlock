// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nurse_LeechTherapy_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LeechTargetParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MissedJarImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PickupBonusModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_strMissedDissolveSound;
};
