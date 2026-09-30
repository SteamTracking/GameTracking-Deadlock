// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_AnimalCurseVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	ModelChange_t m_CursedModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyStartGroup = "+Properties"
	float32 m_flModelScale; // = 0.5
};
