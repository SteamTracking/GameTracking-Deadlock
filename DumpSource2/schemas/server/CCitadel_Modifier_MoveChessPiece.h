class CCitadel_Modifier_MoveChessPiece : public CCitadelModifier
{
	CUtlVector< CHandle< CBaseEntity > > m_vecHitUnits;
	VectorWS m_vecStartLocation;
	VectorWS m_vecEndLocation;
	VectorWS m_vecCornerLocation;
};
