// MHasKV3TransferPolymorphicClassname
class CCitadelModifierChronoPulseGrenadePulseAreaVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PreviewRingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strArmingSound;
	CSoundEventName m_strArmedSound;
	CSoundEventName m_strHitSound;
};
