// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Artist_SilenceAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ImmuneModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyGroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AllyGroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_VisionBlockerModel;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flImmuneDuration; // = 0.5
	bool m_bCreatesVisionBlocker;
	bool m_bVisionBlockerIsInvisible;
	bool m_bDealsDamage;
};
