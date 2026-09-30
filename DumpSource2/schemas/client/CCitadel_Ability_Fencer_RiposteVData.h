// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Fencer_RiposteVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashLineEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RiposteDashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RiposteParriedParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashStart;
	CSoundEventName m_strStunImpactSound;
	CSoundEventName m_strAvoidDamage;
	CSoundEventName m_strStartParry;
	CSoundEventName m_strTargetingLoopSound;
	CSoundEventName m_strTargetingExpireSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetLifestealModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirSpeedMax; // = 1
	float32 m_flAirDrag; // = 1
	float32 m_flFallSpeedMax; // = 1
	float32 m_flParryMoveSpeed; // = 50
	float32 m_flDashAnimDelay; // = 0.27
};
