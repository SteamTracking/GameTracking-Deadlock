// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Shivas_Bracelet_WatcherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FreezeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImmuneModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
};
