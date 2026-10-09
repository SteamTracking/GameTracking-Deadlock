class CCitadel_Modifier_MoveChessPiece : public CCitadelModifier
{
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitUnits;
	VectorWS m_vecStartLocation;
	VectorWS m_vecEndLocation;
	VectorWS m_vecCornerLocation;
};
