// MHasKV3TransferPolymorphicClassname
class CNPC_NeutralSinnerSacrificeVData : public CNPC_TrooperNeutralVData
{
	// MPropertyStartGroup = "Retaliation Attack"
	// MPropertyDescription = "How much damage to deal on retaliate the attacker when this is hit."
	float32 m_flRetaliateDamage;
	// MPropertyStartGroup = "NPC Vault Data"
	float32 m_flVaultMiniGameTime; // = 3
	float32 m_flVaultMiniGameHitWindow; // = 0.5
	float32 m_flVaultMiniGameWheelScrollTime; // = 0.4
	int32 m_iVaultSuccessLightBuffDropCount; // = 1
	int32 m_iVaultSuccessHeavyBuffDropCount; // = 4
	float32 m_flMiniGameFastSpeed; // = 2
	float32 m_flMiniGameFastChance; // = 0.4
	CModelMaterialGroupName m_strFastMaterialGroup;
	float32 m_flVaultLightScrollTime; // = 5
	float32 m_flVaultWheelScrollTime; // = 1.5
	float32 m_flVaultLightFastFlashTime; // = 0.2
	float32 m_flVaultSuccessLightsScroll; // = 0.5
	float32 m_flVaultSuccessWheelScroll; // = 0.5
	float32 m_flVaultSuccessDestroyTime; // = 2
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_VaultSuccessParticle;
	// MPropertyStartGroup = "NPC Vault Sounds"
	CSoundEventName m_VaultIdleLoopSound;
	CSoundEventName m_VaultStartActiveSound;
	CSoundEventName m_VaultActiveLoopSound;
	CSoundEventName m_VaultStartCriticalSound;
	CSoundEventName m_VaultStartFastCriticalSound;
	CSoundEventName m_VaultCriticalLoopSound;
	CSoundEventName m_VaultHitSuccessSoundLight;
	CSoundEventName m_VaultHitSuccessSoundHeavy;
	CSoundEventName m_VaultHitFailSound;
	CSoundEventName m_VaultLightPowerupGainedSound;
	CSoundEventName m_VaultHeavyPowerupGainedSound;
	CSoundEventName m_VaultHit01;
	CSoundEventName m_VaultHit02;
	CSoundEventName m_VaultHit03;
	CSoundEventName m_VaultHit04;
	CSoundEventName m_VaultHit05;
	CSoundEventName m_VaultHit06;
	CSoundEventName m_VaultHit07;
	CSoundEventName m_VaultLight;
	CSoundEventName m_VaultFastLightFlash;
	CSoundEventName m_VaultLightHitWindow;
	CSoundEventName m_VaultWheelSuccessDing;
};
