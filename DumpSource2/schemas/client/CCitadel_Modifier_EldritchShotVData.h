// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_EldritchShotVData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	float32 m_flExplodeParticleSize; // = 40
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
