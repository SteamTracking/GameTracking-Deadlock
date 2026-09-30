// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_WerewolfVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapWerewolfAbilities;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackingBuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffEndingParticle;
	ModelChange_t m_WerewolfModel;
	float32 m_flModelScale; // = 1
	HeroCardOverride_t m_HeroCardOverride;
};
