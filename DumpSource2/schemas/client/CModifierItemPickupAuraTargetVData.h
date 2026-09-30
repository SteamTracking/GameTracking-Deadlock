// MHasKV3TransferPolymorphicClassname
class CModifierItemPickupAuraTargetVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Timers"
	float32 m_PickupTimer;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PickupTimerModifier;
};
