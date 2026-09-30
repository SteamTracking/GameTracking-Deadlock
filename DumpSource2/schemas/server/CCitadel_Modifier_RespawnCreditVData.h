// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RespawnCreditVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Respawn Settings"
	ERejuvenatorRespawnMechanic m_eRespawnMechanic; // = "RejuvenatorRespawnMechanic_FixedDelay"
	// MPropertySuppressExpr = "m_eRespawnMechanic != RejuvenatorRespawnMechanic_FixedDelay"
	// MPropertyDescription = "Respawn time is set to this fixed duration after dying."
	float32 m_flRespawnDelay; // = 3
	// MPropertyStartGroup = "Buff Values"
	float32 m_flBonusClipSize;
	float32 m_flBonusFirerate;
	float32 m_flBonusHealth;
	float32 m_flBonusMoveSpeedMeterPerSecond;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sExpireSound;
	// MPropertyStartGroup = "UI Messages"
	int32 m_iMaxMessages; // = 3
	float32 m_flMessageInterval; // = 0.2
};
