// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Boho_RideBroomVData : public CitadelAbilityVData
{
	float32 m_flChannelingAirDrag; // = 3
	float32 m_flChannelingMaxFallSpeed; // = 5
	float32 m_flVerticalMoveSpeedPercent; // = 1
	float32 m_flAirDrag; // = 1
	float32 m_flAirAcceleration; // = 0.5
	float32 m_flLaunchAirDrag; // = 2
	float32 m_flLaunchTime; // = 0.5
	float32 m_flMoveSpeedAboveBaseScale; // = 0.5
	float32 m_flMinPitch; // = -60
	float32 m_flMaxPitch; // = 80
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LeapModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DustParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TrailParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
};
