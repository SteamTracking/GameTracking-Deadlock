// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_TangoTether_TetherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_HealSound;
	CSoundEventName m_GrappleHitSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisconnectingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisconnectedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LockedTargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NoConnectionModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinConnectTime; // = 3
	float32 m_flDisconnectDistanceBuffer; // = 236
	float32 m_flCandidateCloserDistance; // = 250
	float32 m_flTargetAwayDistance; // = 400
};
