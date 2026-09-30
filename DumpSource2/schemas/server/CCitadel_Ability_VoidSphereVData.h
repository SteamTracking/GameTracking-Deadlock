// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VoidSphereVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BubbleModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strCastEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strAllyPositionPreview;
};
