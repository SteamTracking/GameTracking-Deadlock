// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nurse_HealingNeedleWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_SpreadPenaltyScaleCurve;
	float32 m_flAllyAutoAimStrengthDistMin;
	float32 m_flAllyAutoAimStrengthDistMax;
	float32 m_flAllyAutoAimStrengthMin;
	float32 m_flAllyAutoAimStrengthMax;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingNeedleMuzzleFlashParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	CSoundEventName m_strHitHeadshotSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceBolt;
};
