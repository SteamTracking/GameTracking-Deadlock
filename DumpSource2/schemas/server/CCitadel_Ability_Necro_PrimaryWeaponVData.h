// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_PrimaryWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TetherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DummyTetherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TetheredModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SearchingModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ActiveParticle;
	float32 m_flDefaultSpreadScale; // = 5
	float32 m_flSearchingSpreadScale; // = 10
	float32 m_flTetheredSpreadScale;
	float32 m_flApproachSpeed; // = 0.75
};
