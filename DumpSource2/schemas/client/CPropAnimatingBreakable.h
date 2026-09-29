class CPropAnimatingBreakable : public CBaseAnimGraph
{
	CBreakableStageHelper m_stages;
	CEntityIOOutput m_OnTakeDamage;
	CEntityIOOutput m_OnFinalBreak;
	CEntityIOOutput m_OnStageAdvanced;
};
