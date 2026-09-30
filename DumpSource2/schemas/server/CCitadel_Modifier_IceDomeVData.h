// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_IceDomeVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DomeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyFreezeAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDomeEndSound;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strTargetLoopingSound;
};
