class CCitadel_Ability_Chessmaster_ForkPiece : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hCameraTarget;
	CHandle< CCitadelProjectile > m_cProjectileLeft;
	CHandle< CCitadelProjectile > m_cProjectileRight;
	bool m_bActive;
};
