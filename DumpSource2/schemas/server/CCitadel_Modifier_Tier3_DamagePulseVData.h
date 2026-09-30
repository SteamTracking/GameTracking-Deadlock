// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Tier3_DamagePulseVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberZapParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphZapParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPulseTickSound;
	// MPropertyStartGroup = "Gameplay"
	int32 m_iMaxTargets; // = 2
	float32 m_flRadius; // = 1200
	float32 m_flDamagePerPulse; // = 75
	float32 m_flStartTickRate; // = 1.5
	float32 m_flEndTickRate; // = 0.3
};
