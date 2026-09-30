// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ZombieWallGroundAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strPopSound;
};
