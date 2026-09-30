// MHasKV3TransferPolymorphicClassname
class CAbilityGarbageVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GarbageAuraModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "+Vacuum Properties"
	float32 m_flAirSpeedMax;
	float32 m_flFallSpeedMax; // = 5
	float32 m_flAirDrag; // = 3
	float32 m_flMaxMovespeed; // = 80
};
