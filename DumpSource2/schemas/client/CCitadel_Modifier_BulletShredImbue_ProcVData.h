// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BulletShredImbue_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BuffModifier;
	CEmbeddedSubclass< CBaseModifier > m_BuffNonHeroModifier;
};
