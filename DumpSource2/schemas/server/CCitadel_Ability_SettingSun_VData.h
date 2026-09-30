// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_SettingSun_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamTargetParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_UnitTargetParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SettingSunThinkerModifier;
	float32 m_flSSCameraPreviewOffset; // = 100
	float32 m_flSSCameraPreviewSpeed; // = 0.5
	float32 m_flSSCameraPreviewDistance; // = 300
};
