// MHasKV3TransferPolymorphicClassname
class CAbilityBullChargeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceImpact; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
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
