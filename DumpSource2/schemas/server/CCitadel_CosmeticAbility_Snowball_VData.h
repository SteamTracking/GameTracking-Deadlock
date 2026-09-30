// MHasKV3TransferPolymorphicClassname
class CCitadel_CosmeticAbility_Snowball_VData : public CitadelCosmeticAbilityVData
{
	// MPropertyStartGroup = "Snowball Gameplay"
	float32 m_flMaxLevelDebuffDuration; // = 3
	CLevelProgressionDefinition m_progressionDamage; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	CLevelProgressionDefinition m_progressionCooldown; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	CLevelProgressionDefinition m_progressionSpeed; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	CLevelProgressionDefinition m_progressionCharges; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	CLevelProgressionDefinition m_progressionSnowballCount; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	CLevelProgressionDefinition m_progressionRadius; // = { "m_eBetweenBehavior": "Lerp", "m_mapLevelsToValue": {  } }
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SnowballModifier;
};
