// MPropertySuppressBaseClassField = "m_bProcChanceAffectedByEffectiveness"
// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BaseBulletPreRollProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyDescription = "When true, we roll for a proc once per shot and apply that result to all bullets in the shot.  When false, we roll independently for each bullet in the shot."
	bool m_bRollOnceForAllBulletsInAShot; // = true
	// MPropertyDescription = "When not rolling once for all shots, what's the max number of times we can proc in a single shot? 0 means no limit."
	float32 m_flMaxBulletsToProcInShot;
	// MPropertyDescription = "When true, each bullet can apply its proc to any entities hit.  When false, we only apply the first proc to the first entity."
	bool m_bCanProcMultipleTimesFromSameShot;
	// MPropertyDescription = "When true, will only call OnProc if the target hit passes the unit filter."
	bool m_bRequiresTargetFilter;
	// MPropertyDescription = "When false, Proc'd bullets cannot be evaded"
	bool m_bCanBeEvaded; // = true
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerAdditionParticle;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play on the shooter when a bullet rolls a proc when fired."
	CSoundEventName m_OnBulletRolledProcSound;
};
