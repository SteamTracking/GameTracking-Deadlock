// MPropertySuppressBaseClassField = "m_bProcChanceAffectedByEffectiveness"
// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Mirage_SandPhantom_Proc_VData : public CCitadelModifierVData
{
	// MPropertyDescription = "When true, we roll for a proc once per shot and apply that result to all bullets in the shot.  When false, we roll independently for each bullet in the shot."
	bool m_bRollOnceForAllBulletsInAShot; // = true
	// MPropertyDescription = "When not rolling once for all shots, what's the max number of times we can proc in a single shot? 0 means no limit."
	float32 m_flMaxBulletsToProcInShot;
	// MPropertyDescription = "When true, each bullet can apply its proc to any entities hit.  When false, we only apply the first proc to the first entity."
	bool m_bCanProcMultipleTimesFromSameShot;
	// MPropertyDescription = "When true, will only call OnProc if the target hit passes the unit filter."
	bool m_bRequiresTargetFilter;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcReadyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PassiveVictimModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcReadyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerAdditionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play on the shooter when a bullet rolls a proc when fired."
	CSoundEventName m_OnBulletRolledProcSound;
	CSoundEventName m_ProcSound;
	CSoundEventName m_ExplodeSound;
};
