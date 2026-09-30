// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_HollowPoint_ProcVData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ParticleModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
