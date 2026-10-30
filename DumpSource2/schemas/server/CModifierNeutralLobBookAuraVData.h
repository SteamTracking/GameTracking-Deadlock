// MHasKV3TransferPolymorphicClassname
class CModifierNeutralLobBookAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "Seconds between buildup applications to players inside the field."
	float32 m_flBuildupTickInterval; // = 0.1
	// MPropertyDescription = "Seconds of standing inside the field, from empty, before a player falls asleep."
	float32 m_flFillTime; // = 2.5
	// MPropertyDescription = "Seconds for a full meter to drain back to empty after a player leaves. The grace period before draining starts is the buildup modifier's own m_flBuildUpDecayDelay."
	float32 m_flDrainTime; // = 3
	// MPropertyDescription = "Duration of the sleep applied when a player's meter fills."
	float32 m_flSleepDuration; // = 3
	// MPropertyDescription = "Minimum seconds asleep before damage is allowed to wake the player."
	float32 m_flMinSleepTime; // = 0.3
	// MPropertyDescription = "Delay between being woken and actually waking."
	float32 m_flSleepWakeUpDelay; // = 0.25
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FloorBurstParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwirlParticle;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Played on a player at the moment their meter fills."
	CSoundEventName m_SleepSound;
	// MPropertyStartGroup = "Modifiers"
	// MPropertyDescription = "The buildup meter applied to players standing in the field."
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildupModifier;
	// MPropertyDescription = "Applied when the buildup meter fills."
	CEmbeddedSubclass< CCitadelModifier > m_SleepModifier;
};
