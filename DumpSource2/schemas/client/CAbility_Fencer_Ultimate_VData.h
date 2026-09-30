// MHasKV3TransferPolymorphicClassname
class CAbility_Fencer_Ultimate_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHoldingDuration; // = 1
	float32 m_flSweepingDuration; // = 1
	float32 m_flDamageTimeOffsetFromCamera; // = 0.35
	float32 m_flNonHeroDamageDelay; // = 0.6
	float32 m_flMaxVeerDistanceAllowed; // = 100
	float32 m_flMinCameraSweepSpeed; // = 400
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CasterArrivalModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetNonHeroModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashImpactEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashSwingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashLineEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_UltHoldEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DirPreviewEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashHitEnemy;
};
