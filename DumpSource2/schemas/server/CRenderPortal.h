class CRenderPortal : public CBaseModelEntity
{
	CHandle< CBaseEntity > m_hLocalPortalLink;
	CHandle< CBaseEntity > m_hRemotePortalLink;
	CUtlString m_brushModelName;
	float32 m_flFadeStartDist;
	float32 m_flFadeEndDist;
	float32 m_flFadeStartAngle;
	float32 m_flFadeEndAngle;
	float32 m_flRemoteViewForwardOffset;
	Color m_fadeToColor;
};
