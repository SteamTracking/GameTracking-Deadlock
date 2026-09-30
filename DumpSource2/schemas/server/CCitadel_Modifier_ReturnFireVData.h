// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ReturnFireVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AttackerHitFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpiritReflectTracerReplacement;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAttackerHitSound;
	CSoundEventName m_strHitProcSound;
};
