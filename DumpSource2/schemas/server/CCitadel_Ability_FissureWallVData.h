// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_FissureWallVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FriendlyWallParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyWallParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_WallTravelSoundLoop;
	CSoundEventName m_strWallRemoveSound;
	CSoundEventName m_strApplySlowSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_WallModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flWallPreviewDropdownRate; // = 8
	float32 m_flWallStepHeight; // = 32
	float32 m_flWallTraceRadius; // = 5
};
