// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Hunger_Target_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HungerTargetParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HungerTargetPlayerParticle;
	// MPropertyGroupName = "Audio"
	// MPropertyDescription = "Remap values from Distance to Pitch (MinDistance, MaxDistance, MinDistancePitch, MaxDistancePitch)"
	CRemapFloat m_distanceToPitchRemap;
};
