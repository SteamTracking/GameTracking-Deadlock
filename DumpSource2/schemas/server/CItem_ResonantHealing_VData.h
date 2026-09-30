// MHasKV3TransferPolymorphicClassname
class CItem_ResonantHealing_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_StackNotificationModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OnCastModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RegenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
	// MPropertyGroupName = "Sounds"
	HealingOverTimeLoopSoundOverride_t m_HealingLoopSoundOverride;
};
