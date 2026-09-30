// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Objective_BulletReistVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Objective Bullet Resist"
	// MPropertyDescription = "Bullet Resist with no Enemy Heroes around"
	float32 m_BulletResist; // = 40
	// MPropertyDescription = "Bullet Resist Reduced Per Enemy Hero (Max 0%)"
	float32 m_BulletResistReductionPerHero;
};
