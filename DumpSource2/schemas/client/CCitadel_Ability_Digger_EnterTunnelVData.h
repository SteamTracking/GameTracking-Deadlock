// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Digger_EnterTunnelVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	Vector m_vTeleportOffset;
	Vector m_vStartingOffset;
	float32 m_flMinPushIntoWallDot; // = 0.5
	float32 m_flUninterruptableAfter; // = 0.2
	float32 m_flMoveIntoPositionSpringStrength;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnterParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExitParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_StartTunnelSound;
	CSoundEventName m_ExitTunnelSound;
};
