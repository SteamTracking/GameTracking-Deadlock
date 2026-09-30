// MHasKV3TransferPolymorphicClassname
class CAbilityMedicHealVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealBeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealTargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHealCastSound;
};
