// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Gunslinger_DemonMarkVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_CasterMarkTriggerSound;
	CSoundEventName m_VictimMarkTriggerSound;
};
