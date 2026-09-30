// MHasKV3TransferPolymorphicClassname
class CCitadelModifierItemPickupTimerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnExpireParticle;
	// MPropertyGroupName = "Timers"
	float32 m_TimerToSilence; // = -1
	float32 m_SilenceDuration; // = 0.1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	// MPropertyStartGroup = "Gameplay"
	bool m_bIsIdolPickup;
};
