class CCitadel_Ability_Chessmaster_ForkPiece : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hCameraTarget;
	CHandle< C_CitadelProjectile > m_cProjectileLeft;
	CHandle< C_CitadelProjectile > m_cProjectileRight;
	bool m_bActive;
};
