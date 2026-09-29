// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_HornetLeap : public CCitadelBaseAbility
{
	bool m_bLeaping;
	GameTime_t m_flLeapStartTime;
	ParticleIndex_t m_nFXIndex;
	ParticleIndex_t m_TrailFX;
};
