// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_FocusLens_VData : public CCitadel_Item_TrackingProjectileApplyModifierVData
{
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamageModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ResistReductionModifier;
};
