// MModifierDynamicValuesSuppressCache
class CCitadelModifierInvisBush : public CCitadelModifier
{
	float32 m_flCurrentObscureLevel;
	float32 m_flCurrentInvisLevel;
	GameTime_t m_FadeStartTime;
	bool m_bRevealing;
	float32 m_flRevealStartLevel;
	float32 m_flRevealFadeDuration;
};
