// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Gunslinger_WallStunVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StunModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_CasterMarkTriggerSound;
};
