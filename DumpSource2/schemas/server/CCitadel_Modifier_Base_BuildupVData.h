// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Base_BuildupVData : public CCitadelModifierVData
{
	bool m_bUseBaseWeaponCycleTimeForDelay;
	float32 m_flCycleTimeDelayAdd; // = 0.1
	float32 m_flBuildUpDecayDelay;
	BuildupMode_t m_eBuildupMode; // = "BUILDUP_MODE_ONE_AND_DONE"
	// MPropertyDescription = "When true, effectiveness (distance falloff) will be applied to the buildup."
	bool m_bBuildupAffectedByEffectiveness; // = true
	// MPropertyDescription = "When true, the averaged effectiveness of the build up modifier will be passed to the fill modifier"
	bool m_bPassBuildupEffectivenessToFillModifier; // = true
};
