// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Magician_AnimalHexAreaVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HexAreaModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetWarningSound;
	CSoundEventName m_ProjectileHitConfirm;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
};
