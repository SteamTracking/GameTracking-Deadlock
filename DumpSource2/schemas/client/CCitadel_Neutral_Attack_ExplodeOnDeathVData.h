// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Attack_ExplodeOnDeathVData : public CModifierNeutralAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flExplodeDamage; // = 100
	float32 m_flExplodeRadius; // = 80
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ExplodeDebuffModifier;
};
