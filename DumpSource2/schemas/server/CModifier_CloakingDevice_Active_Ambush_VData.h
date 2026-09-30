// MHasKV3TransferPolymorphicClassname
class CModifier_CloakingDevice_Active_Ambush_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InvisRevealedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbushParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strActivateAmbushSound;
};
