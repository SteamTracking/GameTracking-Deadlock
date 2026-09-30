// MHasKV3TransferPolymorphicClassname
class CCitadel_Werewolf_TransformationVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ReadyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_WerewolfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KillCreditModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TransformEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TransformKillParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bAutoTransformOnReadyComplete;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strEndingWarningSound;
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strAG2PostCastAction; // = "post_cast"
};
