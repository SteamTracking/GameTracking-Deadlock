class CCitadel_Ability_Digger_EnterTunnel : public C_CitadelBaseAbility
{
	CHandle< C_CitadelPassthroughFakeWall > m_hPushedFakeWall;
	CHandle< C_CitadelPassthroughFakeWall > m_hPushedFakeWallLastThink;
};
