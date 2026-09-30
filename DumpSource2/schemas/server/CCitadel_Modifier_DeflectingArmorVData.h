// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_DeflectingArmorVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strImpactSound;
	CSoundEventName m_strProcDeflectionImpactSound;
};
