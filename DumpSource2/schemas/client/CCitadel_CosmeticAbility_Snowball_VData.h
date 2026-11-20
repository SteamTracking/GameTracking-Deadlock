// MHasKV3TransferPolymorphicClassname
class CCitadel_CosmeticAbility_Snowball_VData : public CitadelCosmeticAbilityVData
{
	// MPropertyStartGroup = "Snowball Gameplay"
	float32 m_flMaxLevelDebuffDuration; // = 3
	CLevelProgressionDefinition m_progressionDamage;
	CLevelProgressionDefinition m_progressionCooldown;
	CLevelProgressionDefinition m_progressionSpeed;
	CLevelProgressionDefinition m_progressionCharges;
	CLevelProgressionDefinition m_progressionSnowballCount;
	CLevelProgressionDefinition m_progressionRadius;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SnowballModifier;
};
