// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_ModDisruptorVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DetonateParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DisruptModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flWaveSpeed; // = 0.4
};
