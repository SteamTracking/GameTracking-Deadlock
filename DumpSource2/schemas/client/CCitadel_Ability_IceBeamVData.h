// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_IceBeamVData : public CitadelAbilityVData
{
	float32 m_SplitBeamWidth; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_IceBeamModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildupModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuildupProcModifier;
	// MPropertyStartGroup = "Sound"
	CSoundEventName m_BeamStartSound;
	CSoundEventName m_BeamStopSound;
	CSoundEventName m_BeamPointStartLoopSound;
	CSoundEventName m_BeamPointEndLoopSound;
	CSoundEventName m_BeamPointClosestLoopSound;
};
