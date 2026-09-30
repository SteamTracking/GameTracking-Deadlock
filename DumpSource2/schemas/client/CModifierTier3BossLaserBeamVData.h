// MHasKV3TransferPolymorphicClassname
class CModifierTier3BossLaserBeamVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifierAura > m_GroundAuraModifier;
	float32 m_flAuraDropTickRate; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberLaserBeamEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberLaserPreviewEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphLaserBeamEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphLaserPreviewEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberLaserChargingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphLaserChargingEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLaserLoopSound;
	CSoundEventName m_strLaserFireSound;
	CSoundEventName m_strLaserHitSound;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flLaserDPSToPlayers; // = 440
	float32 m_flLaserDPSMaxHealth; // = 3
	float32 m_flLaserDPSToNPCs; // = 80
	float32 m_flLaserDPSTickRate; // = 0.1
};
