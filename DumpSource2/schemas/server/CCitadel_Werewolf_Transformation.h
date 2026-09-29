class CCitadel_Werewolf_Transformation : public CCitadelBaseAbility
{
	bool m_bIsTransformed;
	bool m_bIsTransformingBack;
	GameTime_t m_tLastRegenComponentThinkTime;
	GameTime_t m_tForceTransformTime;
	GameTime_t m_flWerewolfStartTime;
	CCitadelModifier* m_pWerewolfModifier;
};
