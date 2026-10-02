class CCitadel_Ability_Ratking_EnterTunnel : public CCitadelBaseAbility
{
	Vector m_vStartingPositionSpringVelocity;
	CHandle< CCitadelPassthroughFakeWall > m_hPushedFakeWall;
	CHandle< CCitadelPassthroughFakeWall > m_hPushedFakeWallLastThink;
};
