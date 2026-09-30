// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Magician_CopyUltVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CopyTetherParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_UltCopiedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UltActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InformTargetUltCopiedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CopiedUltSpawnedEntityModifier;
};
