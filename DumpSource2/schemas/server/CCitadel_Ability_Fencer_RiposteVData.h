// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Fencer_RiposteVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashLineEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RiposteDashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RiposteParriedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletReflectAttackerHitFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletReflectImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashStart;
	CSoundEventName m_strStunImpactSound;
	CSoundEventName m_strAvoidDamage;
	CSoundEventName m_strStartParry;
	CSoundEventName m_strTargetingLoopSound;
	CSoundEventName m_strTargetingExpireSound;
	CSoundEventName m_strBulletReflectSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetLifestealModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PommelDebuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirSpeedMax; // = 1
	float32 m_flAirDrag; // = 1
	float32 m_flFallSpeedMax; // = 1
	float32 m_flParryMoveSpeed; // = 50
	float32 m_flDashAnimDelay; // = 0.27
	float32 m_flPommelKnockUpSpeed; // = 300
	float32 m_flPommelKnockBackSpeed; // = 250
};
