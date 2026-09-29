class CCitadel_Ability_Magician_CopyUlt : public C_CitadelBaseAbility
{
	bool m_bHasUsedCopiedUlt;
	bool m_bHasCopiedUlt;
	bool m_bIsModelSwapped;
	GameTime_t m_timeSwappedModel;
	CHandle< C_CitadelBaseAbility > m_pActiveCopyUltimateAbility;
	HeroID_t m_nCopiedHeroID;
	CUtlVector< LingeringCopiedAbility_t > m_vecLingeringCopiedAbilities;
	ModelChange_t m_ModelChange;
};
