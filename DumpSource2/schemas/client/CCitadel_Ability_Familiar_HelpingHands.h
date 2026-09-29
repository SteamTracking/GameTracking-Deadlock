class CCitadel_Ability_Familiar_HelpingHands : public C_CitadelBaseAbility
{
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecHelpers;
	GameTime_t m_tChoreUseCooldownEndTime;
	GameTime_t m_tSoonestHelperCooldownEndTime;
	char m_nAvailableHelperCount;
};
