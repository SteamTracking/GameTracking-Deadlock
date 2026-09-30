// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_GraveStoneVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GravestoneParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CasterBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GravestoneCriticalModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_DestroySound;
};
