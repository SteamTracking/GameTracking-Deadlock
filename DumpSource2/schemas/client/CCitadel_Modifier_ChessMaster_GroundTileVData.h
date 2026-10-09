// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ChessMaster_GroundTileVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundWarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strActivationSound;
	CSoundEventName m_strAuraHitNPCSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDestroyOnParentMove;
	bool m_bDestroyOnParentLost;
	bool m_bShouldApplySlow;
	bool m_bDoDPS;
	bool m_bDetonate;
	bool m_bDetonateOnActivate;
	bool m_bWaitUntilParentOffCooldown;
	float32 m_flActivationDelay; // = -1
};
