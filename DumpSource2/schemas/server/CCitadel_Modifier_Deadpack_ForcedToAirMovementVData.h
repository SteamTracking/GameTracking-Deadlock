// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Deadpack_ForcedToAirMovementVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_flFwdVelocityOverTime;
	CPiecewiseCurve m_flUpVelocityOverTime;
	float32 m_flDashRemovalDelay; // = 0.5
	// MPropertyStartGroup = "Animation"
	CGlobalSymbol m_strHeroState; // = "deadpack_backblast"
	float32 m_flHeroStateDuration;
};
