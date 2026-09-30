// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BubbleVData : public CCitadel_Modifier_SilencedVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
