// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_NetShotVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShootParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strShootSound;
	CSoundEventName m_strHitConfirmSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RootModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BonusDebuffModifier;
};
