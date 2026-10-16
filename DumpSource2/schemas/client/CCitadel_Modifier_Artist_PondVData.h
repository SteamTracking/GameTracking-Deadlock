// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_PondVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PulseParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldPulse;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPulseSound;
};
