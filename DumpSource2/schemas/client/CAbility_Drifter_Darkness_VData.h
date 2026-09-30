// MHasKV3TransferPolymorphicClassname
class CAbility_Drifter_Darkness_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetRevealModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OutOfCombatSprintCamera;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastDelayParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_HitConfirmSound;
};
