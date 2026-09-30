// MHasKV3TransferPolymorphicClassname
class CCitadelItemPunchableNeutralGoldVData : public CCitadelItemPickupVData
{
	float32 m_flGroundOffset; // = 40
	float32 m_flSpinRate; // = 10
	float32 m_flBobHeight; // = 40
	float32 m_flBobFrequency; // = 10
	float32 m_flSpinSpeed; // = 1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PunchPickupModifier;
};
