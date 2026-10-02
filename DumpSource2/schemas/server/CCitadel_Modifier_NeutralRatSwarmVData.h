// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NeutralRatSwarmVData : public CCitadelModifierVData
{
	float32 m_flRatDuration; // = 6
	float32 m_flDamagePerRatPerSecond; // = 2
	float32 m_flDamageInterval; // = 0.5
	ECitadelDamageType m_eDamageType; // = "CITADEL_DAMAGETYPE_ABILITY"
	float32 m_flDashDropFraction; // = 0.5
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashOffSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatParticle;
	int32 m_nMaxRatParticles; // = 5
};
