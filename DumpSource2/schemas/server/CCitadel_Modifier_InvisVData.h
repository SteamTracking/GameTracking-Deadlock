// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_InvisVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InvisLoopParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InvisDetectRadiusParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InvisRevealedParticle;
	float32 m_flDesatFactor; // = 0.54
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strInvisRevealedSound;
	// MPropertyStartGroup = "Behavior"
	bool m_bFadeInsteadOfRemoveOnBulletFire;
	bool m_bFadeInsteadOfRemoveOnAbilityUse;
	bool m_bBreakOnItemUse; // = true
	// MPropertyDescription = "Fade from hidden to fully visible as invis is about to expire. Does not work with Aura applied invis, since that has no duration."
	bool m_bFadeToVisibleAtEndOfDuration; // = true
	float32 m_flMinCloak; // = 0.7
	float32 m_flMaxCloak; // = 0.99
};
