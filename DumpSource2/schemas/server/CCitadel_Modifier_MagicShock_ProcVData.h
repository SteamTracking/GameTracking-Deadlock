// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MagicShock_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_hDamageTrackModifier;
};
