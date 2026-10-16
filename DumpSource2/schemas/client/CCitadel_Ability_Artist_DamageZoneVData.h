// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_DamageZoneVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AreaModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetWarningSound;
	CSoundEventName m_ProjectileHitConfirm;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
};
