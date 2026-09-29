// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Nano_CatForm : public CCitadelBaseAbility
{
	bool m_bIsInCatform;
	GameTime_t m_flLastDamageTime;
	GameTime_t m_flTransformStartTime;
	GameTime_t m_flTransformEndTime;
	float32 m_flStoredDamageAmp;
};
