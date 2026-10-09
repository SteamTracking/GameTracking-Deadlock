class CCitadel_Ability_Chessmaster_KnightBuff : public C_CitadelBaseAbility
{
	CHandle< CCitadel_Ability_Chessmaster_MoveChessPiece > m_hMoveAbility;
	CUtlVector< CModifierHandleTyped< CCitadelModifier > > m_vBuffs;
};
