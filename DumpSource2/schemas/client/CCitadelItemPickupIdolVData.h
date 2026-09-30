// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupIdolVData : public CCitadelItemPickupVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_WalkBackModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PickUpAura;
};
