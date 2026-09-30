// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Cadence_GrandFinale_BuffVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
