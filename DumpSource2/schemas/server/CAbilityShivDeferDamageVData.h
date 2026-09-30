// MHasKV3TransferPolymorphicClassname
class CAbilityShivDeferDamageVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ActiveCastParticle;
	// MPropertyStartGroup = "+Defer Properties"
	float32 m_flDeferredDamageApplicationInterval; // = 0.2
};
