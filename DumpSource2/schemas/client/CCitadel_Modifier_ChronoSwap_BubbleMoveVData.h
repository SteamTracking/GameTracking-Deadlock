// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ChronoSwap_BubbleMoveVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMultiSwapDistFromOrigin; // = 60
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
};
