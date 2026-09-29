class CCitadel_Ability_Familiar_HelpingHands : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecHelpers;
	GameTime_t m_tChoreUseCooldownEndTime;
	GameTime_t m_tSoonestHelperCooldownEndTime;
	char m_nAvailableHelperCount;
};
