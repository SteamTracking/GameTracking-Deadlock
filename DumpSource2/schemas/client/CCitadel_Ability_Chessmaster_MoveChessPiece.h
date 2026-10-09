// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Chessmaster_MoveChessPiece : public C_CitadelBaseAbility
{
	SatVolumeIndex_t m_nSatVolumeIndex;
	GameTime_t m_tCancelHoverTime;
	CHandle< C_BaseEntity > m_pSelectedPiece;
	float32 m_flCachedMoveDistance;
};
