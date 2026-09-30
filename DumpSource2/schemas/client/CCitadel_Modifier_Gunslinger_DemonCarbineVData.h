// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Gunslinger_DemonCarbineVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FullyChargedParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strFullyCharged;
	CSoundEventName m_strShotSound;
};
