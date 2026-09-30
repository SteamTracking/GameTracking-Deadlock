// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nano_Pounce_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LeapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ActiveBuff;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DoublePounceModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AttackParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeSlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PrimaryHitParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AttackSound;
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAttackTimePhase01; // = 0.2
	float32 m_flAttackTimePhase02; // = -0.4
	float32 m_flAllyMinTargetRange; // = 400
	float32 m_flTargetVerticalOffset; // = 60
};
