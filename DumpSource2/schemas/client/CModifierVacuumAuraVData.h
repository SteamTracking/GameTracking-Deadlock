// MHasKV3TransferPolymorphicClassname
class CModifierVacuumAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FinishParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AlliedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strAmbientLoopingLocalPlayerSound;
};
