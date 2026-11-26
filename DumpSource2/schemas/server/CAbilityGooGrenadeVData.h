// MHasKV3TransferPolymorphicClassname
class CAbilityGooGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadeImpactModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadePuddleAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadePuddleAuraFriendlyModifier;
	// MPropertyStartGroup = "Particles"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GooGrenadeSkipParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GooGrenadeExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_GrenadeHitSound;
	// MPropertyStartGroup = "BounceSettings"
	float32 m_flMinRestitution;
	float32 m_flMaxRestitution;
	float32 m_flClimbHeight;
	float32 m_flLedgeForwardClearance; // = 18
	float32 m_flLedgeExtraDropHeight; // = 8
	float32 m_flEdgeBounceMaxNormalDot; // = 0.99
	bool m_bDebug;
};
