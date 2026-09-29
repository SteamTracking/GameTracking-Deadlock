class CCitadelTeleportTrigger : public CTriggerModifier
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	VectorWS m_vExitOrigin;
	CUtlSymbolLarge m_strExitPoint;
	CEntityIOOutput m_OnTeleport;
	CUtlSymbolLarge m_strPropModel;
	float32 m_flTeleportDelay;
};
