// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CounterspellWatcherVData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ParryFXOverride;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealFX;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSuccessProcSound;
};
