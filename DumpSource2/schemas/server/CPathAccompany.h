class CPathAccompany : public CBaseEntity
{
	float32 m_flPathLength;
	CUtlVector< PathAccompanyNode_t > m_vecNodes;
	GameTime_t m_flLastPathRecalc;
	CTransform m_xLastParentTransform;
	bool m_bAllowAutoLead;
	CEntityIOOutput m_OnNpcStartedPath;
	CEntityIOOutput m_OnNpcCompletedPath;
	CEntityIOOutput m_OnNpcBreakFromPath;
	GameTime_t m_nLastDebugDraw;
};
