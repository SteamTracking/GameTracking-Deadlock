class CCitadel_Modifier_Link : public CCitadelModifier
{
	CHandle< CCitadelPortalTrigger > m_hPortalToSource;
	GameTime_t m_flPortalStartTime;
	GameTime_t m_flPortalEndTime;
	CUtlString m_sSourceAttachment;
	CUtlString m_sParentAttachment;
	VectorWS m_vecLinkPosition;
};
