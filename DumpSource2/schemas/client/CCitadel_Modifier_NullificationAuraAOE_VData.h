// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NullificationAuraAOE_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	CSoundEventName m_PurgeSound;
};
