// MHasKV3TransferPolymorphicClassname
class CModifierLockDownDebuffVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEParticleCaster;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEParticleEnemy;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEParticleOthers;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strFollowLoop;
	CSoundEventName m_strEscapedSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RootModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletResistModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilencedModifier;
};
