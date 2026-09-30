// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ChainLightningVData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChainModifier;
};
