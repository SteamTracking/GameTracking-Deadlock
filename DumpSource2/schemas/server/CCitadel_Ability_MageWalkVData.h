// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_MageWalkVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_BubbleModifier;
	CEmbeddedSubclass< CBaseModifier > m_TurretModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strCastEffect;
};
