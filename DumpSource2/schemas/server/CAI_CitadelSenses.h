class CAI_CitadelSenses : public CAI_Senses
{
	CUtlVector< CHandle< CBaseEntity > > m_vecSeenUnits;
	GameTime_t m_flTimeLastLook;
	CITADEL_UNIT_TARGET_TYPE m_iTargetTypes;
};
