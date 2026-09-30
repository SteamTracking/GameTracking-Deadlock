// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_Mystic_RegenerationVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RegenParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_StackNotificationModifier;
	// MPropertyGroupName = "Sounds"
	HealingOverTimeLoopSoundOverride_t m_HealingLoopSoundOverride;
};
