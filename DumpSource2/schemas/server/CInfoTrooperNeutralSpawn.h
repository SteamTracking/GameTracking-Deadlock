class CInfoTrooperNeutralSpawn : public CServerOnlyPointEntity
{
	CEntityIOOutput m_OnNeutralKilled;
	CUtlSymbolLarge m_iszSquadName;
	ENeutralNPCType m_eNeutralNPCType;
	CUtlSymbolLarge m_iszNeutralSubclass;
	CEntityIOOutput m_OnNeutralTakeDamage;
};
