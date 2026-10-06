// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Baba_BenchRun_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMaxChargeJumpDuration;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BenchRunModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargedJumpParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargingJumpParticle;
	float32 m_flChargeJumpAnimSpeedScale; // = 1
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strChargingLoopSound;
	CSoundEventName m_strChargingStartSound;
	CSoundEventName m_strChargedJumpSound;
	CSoundEventName m_strFullyChargedSound;
};
