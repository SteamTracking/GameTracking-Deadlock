// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SpilledBloodThinkerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpilledBloodParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTickRate; // = 0.5
	float32 m_flHeight; // = 80
};
