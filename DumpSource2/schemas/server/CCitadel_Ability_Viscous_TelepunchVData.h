// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Viscous_TelepunchVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PortalParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PunchParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallPunchParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CeilingPunchParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_PunchSound;
	CSoundEventName m_PunchSelfSound;
	CSoundEventName m_EnemyPortalSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PunchRollSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImpactModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyImpactModifier;
	// MPropertyStartGroup = "+Telepunch Parameters"
	float32 m_flEnemyPortalTelegraphTime; // = 0.25
	float32 m_flSelfPortalTelegraphTime; // = 0.25
	float32 m_flWindupTime; // = 0.25
	float32 m_flAttackTime; // = 0.25
	float32 m_flGroundTraceOnPlayerHitDistance; // = 200
	float32 m_flPlayerCheckSphereRadius; // = 20
};
