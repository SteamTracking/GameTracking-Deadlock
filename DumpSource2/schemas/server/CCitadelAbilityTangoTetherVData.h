// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityTangoTetherVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_TetherModifier;
	CEmbeddedSubclass< CBaseModifier > m_GrappleTargetModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletGrappleTracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyGrappleParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDamageTarget;
	CSoundEventName m_strGrappleHitTarget;
	CSoundEventName m_strGrappleHitWorld;
	CSoundEventName m_strGrappleHitNothing;
};
