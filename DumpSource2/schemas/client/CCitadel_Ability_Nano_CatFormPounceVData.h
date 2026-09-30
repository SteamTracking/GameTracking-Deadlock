// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nano_CatFormPounceVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AttackParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCatFormMeleeSwing;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAttackTime; // = 1.5
	float32 m_flAttackRange; // = 160
	float32 m_flAttackHalfAngle; // = 30
	float32 m_flAttackConeHalfWidth; // = 30
	float32 m_flMinAttackTime; // = 0.2
	float32 m_flStopTargetRange; // = 50
	CPiecewiseCurve m_MovementSpeedCurve;
};
