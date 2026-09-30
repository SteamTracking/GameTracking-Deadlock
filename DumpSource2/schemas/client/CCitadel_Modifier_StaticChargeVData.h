// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_StaticChargeVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZapParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strChargeHitSound;
	CSoundEventName m_strChargeHitOtherSound;
};
