// MHasKV3TransferPolymorphicClassname
class CCitadel_Pickup_Turkey_VData : public CCitadel_Pickup_VData
{
	// MPropertyStartGroup = "Buff"
	// MPropertyDescription = "Seconds the turkey buff lasts. Collecting another turkey restarts it."
	float32 m_flBuffDuration; // = 30
	// MPropertyDescription = "Modifier given to whoever collects the turkey."
	CEmbeddedSubclass< CCitadelModifier > m_TurkeyBuffModifier;
	// MPropertyStartGroup = "Hover"
	// MPropertyDescription = "Seconds one full bob up and down takes. Also how long the turkey takes to rise to its hover after landing."
	float32 m_flHoverRate; // = 2
	// MPropertyDescription = "How far above and below Hover Offset the turkey bobs."
	float32 m_flHoverHeight; // = 20
	// MPropertyDescription = "Seconds one full turn takes once the turkey is hovering."
	float32 m_flHoverTurnRate; // = 10
};
