// MHasKV3TransferPolymorphicClassname
class CAbilityWreckerTeleportVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpectatingProjectileParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	float32 m_ArrowOffsetX; // = -100
	float32 m_ArrowCameraDistance; // = 100
	float32 m_ArrowCameraHeightOffset; // = 30
	float32 m_ArrowInitialPitch; // = -85
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GuidingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTrackAmount; // = 110
	float32 m_flSpeedAccel; // = 800
	float32 m_flSpeedDeccel; // = 300
	float32 m_flBaseProjectileSpeed; // = 700
	float32 m_flMaxProjectileSpeed; // = 1400
};
