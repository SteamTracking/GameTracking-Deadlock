// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_DPS_Aura_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOECastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ActiveModifier;
};
