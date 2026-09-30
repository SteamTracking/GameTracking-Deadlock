// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_KickFlipVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Motion"
	CPiecewiseCurve m_LeapingSpeedCurve;
	float32 m_flVelocityCarryoverOnMiss; // = 0.33
	float32 m_flFracToAllowUp; // = 0.33
	float32 m_flGroundBreakOffAngle; // = 10
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KickHitImpact;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PushOffImpact;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BootKickCast;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_KickHitSound;
	CSoundEventName m_strPushOffSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SuccessSelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SuccessEnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LeapingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DisarmModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MarkModifier;
};
