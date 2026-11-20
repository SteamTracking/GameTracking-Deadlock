// MHasKV3TransferPolymorphicClassname
class CAbilityBullChargeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceImpact;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_ModifierTossAirControlLockout;
	CEmbeddedSubclass< CBaseModifier > m_ModifierWeaponPowerIncrease;
	CEmbeddedSubclass< CBaseModifier > m_ModifierChargeDragEnemy;
	CEmbeddedSubclass< CBaseModifier > m_ModifierBullCharging;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWallSlamSound;
	CSoundEventName m_strHitEnemySound;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flWallStunLookAheadDist; // = 80
	float32 m_flEndChargeVelocityScale; // = 1
};
