// MHasKV3TransferPolymorphicClassname
class CAbilityLashUltimateVData : public CBaseLockonAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaunchParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_UltimateCastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_UltimateCastEnemyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AllyIndicatorParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_LashGrappleEnemy_Debuff > m_GrappleEnemyModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_GrabSound;
	CSoundEventName m_MissSound;
	CSoundEventName m_ThrowSound;
	// MPropertyStartGroup = "+Ultimate Properties"
	float32 m_flAirSpeedMax;
	float32 m_flFallSpeedMax; // = 5
	float32 m_flAirDrag; // = 3
	float32 m_flMaxPitchRangeScale; // = 2
	float32 m_flThrowAnimTossPoint; // = 0.75
};
