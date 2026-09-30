// MHasKV3TransferPolymorphicClassname
class CCitadel_Upgrade_AmmoScavenger_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_StackSound;
	CSoundEventName m_AmmoSound;
};
