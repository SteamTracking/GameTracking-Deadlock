class CNPC_ChessPiece : public C_AI_CitadelNPC
{
	GameTime_t m_tCooldownStartTime;
	GameTime_t m_tCooldownEndTime;
	CHandle< C_CitadelBaseAbility > m_hAbility;
	int32 m_iChessPieceState;
	int32 m_iChessPieceType;
	float32 m_flMeleeDamage;
	float32 m_flLifetime;
	CModifierHandleTyped< CCitadelModifier > m_hCooldownModifier;
};
