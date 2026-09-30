// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_CultistSacrifice_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strOffCooldownSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastTargetEffect;
};
