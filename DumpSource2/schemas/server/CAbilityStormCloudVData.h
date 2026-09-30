// MHasKV3TransferPolymorphicClassname
class CAbilityStormCloudVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEPreviewParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_StormCloudModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LightningStrikeAOEModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLightningStrikeCast;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flOscillateFrequency; // = 1
	float32 m_flOscillateSpeed; // = 20
	float32 m_flOscillateSpeedStart; // = 40
	float32 m_flOscillateStartOffset; // = 0.25
	float32 m_flAirDrag; // = 10
	float32 m_flFlightAirDrag; // = 3
	float32 m_flVerticalMoveSpeedPercent; // = 1
	float32 m_flAirAcceleration; // = 2.5
};
