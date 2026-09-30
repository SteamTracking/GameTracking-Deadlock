// MHasKV3TransferPolymorphicClassname
class CItem_Infuser_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
};
