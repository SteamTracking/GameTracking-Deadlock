// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Fencer_ThrowBladeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MarkParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MarkLingerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaunchTrailParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisarmModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UIRecastModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flUpDisenageJumpRatio; // = 1
	float32 m_flMinDisengageAmountBack; // = 0.5
	float32 m_flForwardPlacementDistance; // = 100
	float32 m_flHeightAboveGround; // = 80
	CPiecewiseCurve m_velocityCurve;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sStartSound;
	CSoundEventName m_sExpiredSound;
	CSoundEventName m_strHitSound;
};
