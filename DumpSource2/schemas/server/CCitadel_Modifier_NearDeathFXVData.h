// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NearDeathFXVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyNearDeathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FriendlyNearDeathParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sSelfDestructStart;
	CSoundEventName m_sSelfDestructEnd;
};
