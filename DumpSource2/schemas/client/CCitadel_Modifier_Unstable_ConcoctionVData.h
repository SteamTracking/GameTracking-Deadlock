// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Unstable_ConcoctionVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_UnstoppableModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
