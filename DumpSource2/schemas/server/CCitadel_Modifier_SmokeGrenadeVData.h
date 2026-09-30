// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SmokeGrenadeVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SmokeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDomeEndSound;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strTargetLoopingSound;
};
