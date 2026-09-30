// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Unicorn_DazzlingOrbVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_FallSpeedCurve;
	float32 m_flAirSpeedMax;
	float32 m_flAirDrag; // = 3
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_OrbWatcherModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
};
