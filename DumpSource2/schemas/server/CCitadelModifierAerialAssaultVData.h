// MHasKV3TransferPolymorphicClassname
class CCitadelModifierAerialAssaultVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FireRateModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirDrag; // = 1
	float32 m_flAirSpeed; // = 100
	float32 m_flFallSpeed; // = 30
};
