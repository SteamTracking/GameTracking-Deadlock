// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_TechCleaveVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CleavePlayerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CleaveTrooperParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sVictimSound;
};
