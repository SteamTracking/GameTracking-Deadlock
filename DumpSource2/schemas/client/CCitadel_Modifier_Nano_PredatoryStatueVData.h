// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Nano_PredatoryStatueVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnabledParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DrainParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strEnabledSound;
	CSoundEventName m_strEnabledLoopSound;
	CSoundEventName m_strDisabledSound;
	CSoundEventName m_strLaserHitSound;
	CSoundEventName m_strLaserStartSound;
	CSoundEventName m_strLaserLoopSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RevealModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StatueInvis;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flNewTargetAttackTime; // = 0.5
	float32 m_flMinRevealTime; // = 2
	float32 m_flMinDebuffTime; // = 3
};
