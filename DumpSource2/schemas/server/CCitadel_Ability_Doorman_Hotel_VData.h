// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Doorman_Hotel_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_NoDrawModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FreezeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HotelModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamageModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TeleportFXModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PreTeleportModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UnstoppableWhileChannelingModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Doorman_Hotel_Imposter > m_ImposterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TrackEnemy;
	CEmbeddedSubclass< CCitadelModifier > m_TimeslowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelStartParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLateHitConfirmSound;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "How long to delay triggering the relay in the hotel after cast on a target"
	float32 m_flSequenceTriggerOffset;
	// MPropertyDescription = "Delay after casting before teleporting to the hotel"
	float32 m_flTeleportToHotelDelay; // = 1
	// MPropertyDescription = "Delay after reaching the exit (or failing to) before teleporting back to source"
	float32 m_flTeleportToSourceDelay; // = 0.5
	// MPropertyDescription = "Delay after teleporting to the source before control is given back to the player. This period is for the player to get their bearings"
	float32 m_flPostSourceTeleportHold; // = 0.5
	// MPropertyDescription = "How long the face to black should be for the teleports"
	float32 m_flFadeToBlackDuration; // = 0.4
	// MPropertyDescription = "Doorman's max speed while channeling.  The victim's is specified in the pre-teleport modifier."
	float32 m_flDoormanGroundSpeedMax;
	// MPropertyDescription = "Doorman's max air speed while channeling.  The victim's is specified in the pre-teleport modifier."
	float32 m_flDoormanAirSpeedMax;
	// MPropertyDescription = "Doorman's fall speed while channeling.  The victim's is specified in the pre-teleport modifier."
	float32 m_flDoormanFallSpeedMax; // = 5
	// MPropertyDescription = "Doorman's air drag while channeling.  The victim's is specified in the pre-teleport modifier."
	float32 m_flDoormanAirDrag; // = 3
};
