// MHasKV3TransferPolymorphicClassname
class CAbilityHookVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletAmpModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HookOutParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PrecastHookParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HookRetrieveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HookServerImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHookSuccessSound;
	CSoundEventName m_strHookNPCSound;
	CSoundEventName m_strHookAllySound;
	CSoundEventName m_strHookImpactGeoSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTrooperHitRadius; // = 12
	float32 m_flFriendlyHookIgnoreRange; // = 300
};
