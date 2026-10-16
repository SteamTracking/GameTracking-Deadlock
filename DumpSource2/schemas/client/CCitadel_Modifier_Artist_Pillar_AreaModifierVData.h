// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_Pillar_AreaModifierVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PillarModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoECastEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
};
