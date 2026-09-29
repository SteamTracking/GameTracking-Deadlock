class CCitadel_Ability_ShieldedSentry : public C_CitadelBaseAbility
{
	int32 k_nOldestSentriesToShowInUI;
	C_NetworkUtlVectorBase< CHandle< C_NPC_ShieldedSentry > > m_vecDeployedSentries;
};
