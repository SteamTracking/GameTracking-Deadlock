// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ItemPunchable_RejuvVData : public CCitadelModifierVData
{
	int32 m_iRejuvBossKill01; // = 3
	int32 m_iRejuvBossKill02; // = 3
	float32 m_flPhysicsRadius; // = 40
	float32 m_flMaxDistForHeal; // = 1400
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IsDroppingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IsPunchableParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IsFrozenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamagedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEHealParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_NearRejuvAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ParryCheckModifier;
	// MPropertyGroupName = "Audio"
	CSoundEventName m_sHitSound;
};
