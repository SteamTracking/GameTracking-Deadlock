// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_DelayedAOERootVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RootModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldDeployGroundAura;
};
