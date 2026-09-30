// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_LightMeleeVData : public CModifierNeutralAbilityVData
{
	float32 m_flForwardOffset; // = 60
	float32 m_flMeleeRadius; // = 100
	float32 m_flDamage;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAttackHitSound;
	CSoundEventName m_strAttackMissSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeImpactParticle;
};
