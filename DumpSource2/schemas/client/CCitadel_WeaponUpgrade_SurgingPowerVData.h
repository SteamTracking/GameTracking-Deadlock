// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_SurgingPowerVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ModifierSurgingPower;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastTargetEffect;
};
