// MHasKV3TransferPolymorphicClassname
class CItem_RestorativeLocket_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TrailParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStackSound;
	CSoundEventName m_strMaxStackSound;
	CSoundEventName m_strTargetHealSound;
};
