// MHasKV3TransferPolymorphicClassname
class CModifierLashGrappleTargetVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LockingOnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LockedOnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WarningParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strVictimLockonSound;
};
