class C_RenderPortal : public C_BaseModelEntity
{
	CHandle< C_BaseEntity > m_hLocalPortalLink;
	CHandle< C_BaseEntity > m_hRemotePortalLink;
	CUtlString m_brushModelName;
	float32 m_flFadeStartDist;
	float32 m_flFadeEndDist;
	float32 m_flFadeStartAngle;
	float32 m_flFadeEndAngle;
	float32 m_flRemoteViewForwardOffset;
	Color m_fadeToColor;
};
