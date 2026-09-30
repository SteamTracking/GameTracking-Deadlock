// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityChargedBombVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChargeBombModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "GamePlay"
	float32 m_flChargeForMaxDamage; // = 1.5
	float32 m_flMinDamagePercent; // = 0.3
};
