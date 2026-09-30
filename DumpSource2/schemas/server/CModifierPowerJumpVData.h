// MHasKV3TransferPolymorphicClassname
class CModifierPowerJumpVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FloatParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirDrag; // = 1
	float32 m_flVerticalCameraOffset;
	float32 m_flVerticalCameraOffsetLerpTime; // = 0.1
	float32 m_flVerticalCameraOffsetBias; // = 0.8
};
