class CCitadel_Modifier_SpookyHide_Invis : public CCitadel_Modifier_Invis
{
	CUtlOrderedMap< CCitadelPlayerPawn*, GameTime_t > m_mapStartLookTime;
	GameTime_t m_flStartSpotted;
};
