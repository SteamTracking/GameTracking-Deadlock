// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_BuildUpVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImmobilizeBuildupParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bBuildupOnHit;
	bool m_bTriggerOnFull;
	bool m_bTriggerOnPartial;
	bool m_bStunOnFull;
	bool m_bPullOnFull; // = true
};
