class CCitadel_Modifier_FissureWall : public CCitadelModifier
{
	CUtlVector< CHandle< CBaseEntity > > m_vecFissureWallEntities;
	CUtlVector< CHandle< CBaseEntity > > m_vecFisureEntitiesHit;
	int32 m_nSegment;
	VectorWS m_vPosition;
	Vector m_vDirection;
	Vector m_vLeft;
	float32 m_Length;
	Vector m_vBiasDirLeft;
	VectorWS m_vBiasPosLeft;
	Vector m_vBiasDirRight;
	VectorWS m_vBiasPosRight;
};
