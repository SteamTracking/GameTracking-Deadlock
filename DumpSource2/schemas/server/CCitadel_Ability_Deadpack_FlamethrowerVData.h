// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Deadpack_FlamethrowerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ScorchParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BackblastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ResistModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BackblastModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BeamStartSound;
	CSoundEventName m_BeamStopSound;
	CSoundEventName m_BackblastSound;
	CSoundEventName m_BeamPointStartLoopSound;
	CSoundEventName m_BeamPointClosestLoopSound;
};
