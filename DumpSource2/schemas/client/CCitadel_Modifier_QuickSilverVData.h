// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_QuickSilverVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
};
