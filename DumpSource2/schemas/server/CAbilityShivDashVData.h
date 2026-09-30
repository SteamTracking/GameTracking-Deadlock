// MHasKV3TransferPolymorphicClassname
class CAbilityShivDashVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DashModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashImpactEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashSwingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashLineEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashStartEcho;
	CSoundEventName m_strDashHitEnemy;
	// MPropertyStartGroup = "+Dash Properties"
	float32 m_flEchoDelay; // = 0.5
};
