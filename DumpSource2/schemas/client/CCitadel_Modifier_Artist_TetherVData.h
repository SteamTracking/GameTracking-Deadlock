// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_TetherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ImmobilizeModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TetherParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImmobilizeBuildupParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeHitConfirmSound;
};
