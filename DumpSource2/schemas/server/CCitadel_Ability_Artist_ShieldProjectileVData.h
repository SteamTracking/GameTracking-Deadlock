// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_ShieldProjectileVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BarrierModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
};
