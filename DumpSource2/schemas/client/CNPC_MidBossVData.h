// MHasKV3TransferPolymorphicClassname
class CNPC_MidBossVData : public CAI_CitadelNPCVData
{
	int32 m_iStartingHealth; // = 6000
	int32 m_iHealthGainPerMinute; // = 325
	float32 m_flAggroDuration; // = 4
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DyingSmallExplosion;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DyingFinalExplosion;
	float32 m_flDyingDuration; // = 2
};
