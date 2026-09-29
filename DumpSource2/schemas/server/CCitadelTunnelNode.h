class CCitadelTunnelNode : public CBaseModelEntity
{
	CUtlSymbolLarge m_strNode01;
	CUtlSymbolLarge m_strNode02;
	CUtlSymbolLarge m_strNode03;
	bool m_bIsExit;
	int32 m_nTunnelID;
	CHandle< CCitadelTunnelNode > m_hConnection1;
	CHandle< CCitadelTunnelNode > m_hConnection2;
	CHandle< CCitadelTunnelNode > m_hConnection3;
};
