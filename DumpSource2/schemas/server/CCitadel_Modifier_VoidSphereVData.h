// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_VoidSphereVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportTrailParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportModelParticle;
	// MPropertyGroupName = "Misc"
	float32 m_flPreTeleportDuration; // = 0.4
	CPiecewiseCurve m_TeleportVerticalOffsetCurve;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strAmbientLoopingLocalPlayerSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BuffModifier;
};
