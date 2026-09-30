// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BerserkerDamageStackVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffStatusParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffStatusParticleEnemy;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBerserkerStackSound;
	CSoundEventName m_strMaxStackLayer;
};
