// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_LaserBeamVData : public CModifierNeutralAbilityVData
{
	float32 m_flBeamDPS; // = 100
	float32 m_flStartDistancem; // = 2.5
	float32 m_flBeamMoveSpeedm; // = 4
	float32 m_flAuraDropTickRate; // = 0.2
	float32 m_flAuraDuration; // = 4
	float32 m_flBeamWidth; // = 10
	float32 m_flBeamLength; // = 750
	float32 m_flMaxTurnRate; // = 1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifierAura > m_GroundAuraModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamChargingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamPreviewEffect;
	float32 m_flBeamPreviewRadius; // = 5
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BeamStartSound;
	CSoundEventName m_BeamStopSound;
	CSoundEventName m_BeamPointStartLoopSound;
	CSoundEventName m_BeamPointClosestLoopSound;
};
