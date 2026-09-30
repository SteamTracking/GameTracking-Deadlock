// MHasKV3TransferPolymorphicClassname
class CItemSingleTargetStunVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StunDelayModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strCastHitSound;
};
