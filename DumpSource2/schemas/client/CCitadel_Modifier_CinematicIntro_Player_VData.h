// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CinematicIntro_Player_VData : public CCitadelModifierVData
{
	float32 m_flZiplineStartDelayDuration;
	CUtlVector< PostProcessEffectDef_t > m_vecPostProcessEffects;
	bool m_bTeamSpecificCameras; // = true
	// MPropertySuppressExpr = "m_bTeamSpecificCameras == false"
	CUtlVector< IntroCamera_t > m_vecIntroCameraSequenceAmber;
	// MPropertySuppressExpr = "m_bTeamSpecificCameras == false"
	CUtlVector< IntroCamera_t > m_vecIntroCameraSequenceSapphire;
	// MPropertySuppressExpr = "m_bTeamSpecificCameras == true"
	CUtlVector< IntroCamera_t > m_vecIntroCameraSequence;
};
