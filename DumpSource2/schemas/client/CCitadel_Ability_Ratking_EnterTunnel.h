class CCitadel_Ability_Ratking_EnterTunnel : public C_CitadelBaseAbility
{
	Vector m_vStartingPositionSpringVelocity;
	CHandle< C_CitadelPassthroughFakeWall > m_hPushedFakeWall;
	CHandle< C_CitadelPassthroughFakeWall > m_hPushedFakeWallLastThink;
};
