// MHasKV3TransferPolymorphicClassname
class CModifierPsychicLiftVData : public CCitadel_Modifier_StunnedVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisarmModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LiftParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flOccilateMaxDistance; // = 100
	float32 m_flOccilateDegreesPerSecond; // = 360
	float32 m_flRiseTime; // = 0.5
	// MPropertyDescription = "Once this duration has pased in the slam, we start forcing the target to the ground"
	float32 m_flSlamTime; // = 0.25
	float32 m_flRiseAcc; // = 100
	float32 m_flRiseMaxSpeed; // = 100
	float32 m_flRiseDecayFracStart; // = 0.5
	float32 m_flRiseDecayFracEnd; // = 0.9
	float32 m_flSlamAcc; // = 500
	float32 m_flSlamMaxSpeed; // = 2000
	float32 m_flSlamImpactRadius; // = 50
};
