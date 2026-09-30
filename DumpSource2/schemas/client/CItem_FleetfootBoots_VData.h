// MHasKV3TransferPolymorphicClassname
class CItem_FleetfootBoots_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FleetfootBootsModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FleetfootBootsBonusClipModifier;
};
