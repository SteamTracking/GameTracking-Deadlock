// MHasKV3TransferPolymorphicClassname
class CAbilityMeleeParryVData : public CitadelAbilityVData
{
	float32 m_flWhiffDuration;
	float32 m_flMovementRestrictionTime;
	float32 m_flActiveTime;
	float32 m_flParryEndVisualTime;
	float32 m_flSuccessActiveTime;
	float32 m_flMashProtectTime; // = 0.25
	float32 m_flBossVictimNoMeleeTime; // = 7
	float32 m_flBossVictimCalmTime; // = 2
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SuccessfulParryParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SuccessfulAbilityParryParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ActiveParryParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSuccessfulParrySound;
	CSoundEventName m_strSuccessfulParryTrooperSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ParryActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryVictimModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryCooldownModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryEndVisualModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryBossVictimNoMeleeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryBossVictimCalmModifier;
};
