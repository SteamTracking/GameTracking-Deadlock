class CCitadel_ArmorUpgrade_AutoCleanse : public CCitadel_Item
{
	CUtlStringToken m_nAbilityBlocking;
	GameTime_t m_nAbilityBlockTime;
	CHandle< CBaseEntity > m_hModifierCaster;
};
