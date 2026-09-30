// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Familiar_AttachedVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strForceDetachSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ItemUsedParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HostModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ReplicatedBarrierModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AttachEndingModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flInputHoldTimeToCancel;
	float32 m_flEndingWarningDuration;
};
