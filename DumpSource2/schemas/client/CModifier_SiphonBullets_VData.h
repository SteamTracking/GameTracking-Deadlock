// MHasKV3TransferPolymorphicClassname
class CModifier_SiphonBullets_VData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StealWatcherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HealModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
