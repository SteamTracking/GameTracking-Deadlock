class CCitadel_Ability_Digger_EnterTunnel : public CCitadelBaseAbility
{
	CHandle< CCitadelPassthroughFakeWall > m_hPushedFakeWall;
	CHandle< CCitadelPassthroughFakeWall > m_hPushedFakeWallLastThink;
};
