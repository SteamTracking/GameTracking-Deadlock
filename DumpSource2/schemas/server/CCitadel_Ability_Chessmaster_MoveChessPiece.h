// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Chessmaster_MoveChessPiece : public CCitadelBaseAbility
{
	GameTime_t m_tCancelHoverTime;
	CHandle< CBaseEntity > m_pSelectedPiece;
	float32 m_flCachedMoveDistance;
};
