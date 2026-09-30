// MHasKV3TransferPolymorphicClassname
class CCitadel_Hideout_ClockVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HourParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MinuteParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStartHourSound;
	CSoundEventName m_strHourSound;
	CSoundEventName m_strMinuteSound;
	float32 m_flHourChimeInterval; // = 1
};
