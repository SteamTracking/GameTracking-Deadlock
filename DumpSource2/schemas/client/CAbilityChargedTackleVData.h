// MHasKV3TransferPolymorphicClassname
class CAbilityChargedTackleVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargePreviewParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChargePrepareModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ChargeActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DragModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strHitSound;
};
