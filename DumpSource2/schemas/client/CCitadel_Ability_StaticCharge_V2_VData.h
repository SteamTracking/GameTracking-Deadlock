// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_StaticCharge_V2_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StaticChargeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StaticChargeWorldModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flWorldTraceRadius; // = 5
	float32 m_flUnitTraceRadius; // = 5
};
