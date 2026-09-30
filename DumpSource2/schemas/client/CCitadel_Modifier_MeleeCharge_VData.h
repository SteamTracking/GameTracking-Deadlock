// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MeleeCharge_VData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ReloadVisualModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AmmoAddedVisualModifier;
};
