// MHasKV3TransferPolymorphicClassname
class CItemCapacitorVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_PurgeSound;
};
