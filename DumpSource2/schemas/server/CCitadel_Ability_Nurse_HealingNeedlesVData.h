// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nurse_HealingNeedlesVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ProcModifier;
	// MPropertyStartGroup = "Gameplay"
	CSubclassName< 4 > m_NewWeaponAbility;
	float32 m_flMinTimeBeforeSwappingBack; // = 0.2
	// MPropertyStartGroup = "Animation"
	// MPropertyDescription = "Value to set "hero_action" to while casting to put the needles away (m_strAG2CastingAction is used when getting them out)"
	CGlobalSymbol m_strAG2PutAwayCastingAction;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingNeedleEntImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingNeedleImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealingNeedleProcParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmPlayer;
	CSoundEventName m_strHitConfirmPlayerHeadshot;
	CSoundEventName m_strHitConfirmNPC;
	CSoundEventName m_strHitConfirmMaxHealth;
	CSoundEventName m_strTopOffSound;
	CSoundEventName m_strProcSound;
	CSoundEventName m_strSwapToHealingSound;
	CSoundEventName m_strSwapToPrimarySound;
};
