// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_UltimateBurst_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LightningParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DelayedEffectModifier;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLightningSound;
};
