// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NeutralSelfCastBombVData : public CModifierNeutralAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRadius; // = 400
	float32 m_flExplodeTime; // = 4
	float32 m_flDamage; // = 100
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BombAttachedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BombAttachedStatusEffectParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strTickTockSound;
	CSoundEventName m_strTickTockFastSound;
	float32 m_DetonateWarningTime; // = 1.2
};
