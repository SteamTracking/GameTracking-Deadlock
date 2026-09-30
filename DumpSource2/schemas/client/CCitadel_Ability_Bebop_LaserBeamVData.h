// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bebop_LaserBeamVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RestrictionModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flCancelCooldown; // = 3
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticleLocal;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamHitParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLaserStartSound;
	CSoundEventName m_strLaserEndSound;
	CSoundEventName m_strLaserLoopSound;
	CSoundEventName m_strLaserHitSound;
};
