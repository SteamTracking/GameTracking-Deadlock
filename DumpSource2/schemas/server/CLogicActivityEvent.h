class CLogicActivityEvent : public CLogicalEntity
{
	int32 m_nEventType;
	float32 m_flDuration;
	CUtlSymbolLarge m_iszSourceEntityName;
	CEntityHandle m_hSource;
};
