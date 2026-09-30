// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SpiritBurnEnemyTrackerVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	// MPropertyDescription = "Applied to a burned target as its per-target cooldown; blocks re-triggering while present."
	CEmbeddedSubclass< CBaseModifier > m_ImmunityModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
};
