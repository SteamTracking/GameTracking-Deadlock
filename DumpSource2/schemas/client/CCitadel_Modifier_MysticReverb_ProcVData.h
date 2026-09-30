// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MysticReverb_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_ExplosionModifier;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
};
