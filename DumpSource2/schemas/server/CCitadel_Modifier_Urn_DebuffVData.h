// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Urn_DebuffVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EntangleModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strEntangleCounter;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strEntangleSound;
	CSoundEventName m_strEntangleBuildupSound;
};
