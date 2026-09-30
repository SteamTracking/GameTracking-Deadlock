// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_TechCleaveVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TechCleaveModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sCleaveProcSound;
};
