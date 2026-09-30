// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_CurvedBombAttackVData : public CCitadel_Neutral_Attack_BulletToPointModifierVData
{
	float32 m_flDamage; // = 100
	// MPropertyDescription = "Inheritance as a fraction (normally 0-1) of the target's speed magnitude at acquisition time."
	float32 m_flTargetSpeedInheritance;
};
