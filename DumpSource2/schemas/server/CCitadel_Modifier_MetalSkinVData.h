// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MetalSkinVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffEndParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitProcSound;
};
