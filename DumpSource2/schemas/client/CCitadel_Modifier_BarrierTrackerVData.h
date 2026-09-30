// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BarrierTrackerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WeaponImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TechImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldBreakParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_ShieldBreakSound;
	CSoundEventName m_strShieldRefreshSound;
	// MPropertyStartGroup = "Modifiers"
	float32 m_flShieldImpactEffectDuration; // = 2
};
