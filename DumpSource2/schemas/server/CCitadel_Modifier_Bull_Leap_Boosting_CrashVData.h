// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Bull_Leap_Boosting_CrashVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DragModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CrashTrailParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flCollideRadius; // = 100
};
