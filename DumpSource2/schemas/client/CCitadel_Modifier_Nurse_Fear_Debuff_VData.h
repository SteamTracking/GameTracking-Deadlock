// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Nurse_Fear_Debuff_VData : public CCitadel_Modifier_FearedVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strFearAppliedSound;
	CSoundEventName m_strFearAppliedNPCSound;
};
