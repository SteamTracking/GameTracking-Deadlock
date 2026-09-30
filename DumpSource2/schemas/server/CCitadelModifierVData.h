// MPropertySuppressBaseClassField = "m_nDisableGroupsMask"
// MPropertySuppressBaseClassField = "m_sEndSound"
// MHasKV3TransferPolymorphicClassname
class CCitadelModifierVData : public CModifierVData
{
	bool m_bIsBuildup;
	// MPropertySuppressField
	bool m_bNetworkValuesForStatsPreview;
	CUtlVector< CUtlString > m_vecAutoRegisterModifierValueFromAbilityPropertyName;
	// MPropertyDescription = "Intrinsic modifiers only. When false, the modifier is removed while its owning ability is swapped out of its slot (as in the case with sinclair stealing it, and it going away). True is usually what you want."
	bool m_bPersistWhileAbilityDormant; // = true
	// MPropertyStartGroup = "Kill & Assist Credit"
	bool m_bCasterCountsAsAssister; // = true
	// MPropertyDescription = "When set, an additional, invisible modifier will be left on the parent when this modifier expires.  This is to aid in giving assist credit for modifiers that deal no damage (ex. Astro's Lasso)"
	float32 m_flLingeringAssistWindow;
	// MPropertyStartGroup = "Time"
	// MPropertyDescription = "When set, the duration will get scaled depending on the owner's timescale"
	bool m_bDurationCanBeTimeScaled;
	bool m_bDurationReducible; // = true
	// MPropertyDescription = "When set, the duration will get reduced based on recent CC applied to the victim"
	bool m_bDurationReducibleByCrowdControlDiminish; // = true
	// MPropertyDescription = "Whose timescale to use when adjusting duration."
	ModifierTimeScaleSource_t m_eTimeScaleSource; // = "MODIFIER_TIME_SCALE_USE_PARENT"
	// MPropertyDescription = "When true, the 'effectiveness' value for the modifier will be used to scale the duration. You most likely want 'Keep Maximum Duration On Refresh' to match this value"
	bool m_bDurationAffectedByEffectiveness;
	// MPropertyStartGroup = "AnimGraph2"
	// MPropertyFriendlyName = "base_action value"
	// MPropertyDescription = "The value to set the parameter "base_action" to.  Should be used for actions that are common to all heroes (ex. lifted)."
	ParamAndPriority_t m_AG2BaseAction;
	// MPropertyFriendlyName = "base_state value"
	// MPropertyDescription = "The value to set the parameter "base_state" to.  Should be used for states that are common to all heroes (ex. asleep)."
	ParamAndPriority_t m_AG2BaseState;
	// MPropertyFriendlyName = "hero_state value"
	// MPropertyDescription = "The value to set the parameter "hero_state" to.  Should be used for states that are custom for the casting hero (ex. icepathing, flamedashing)."
	ParamAndPriority_t m_AG2HeroState;
	// MPropertyStartGroup = "UI"
	ModifierOverheadDrawType_t m_eDrawOverheadStatus; // = "OVERHEAD_DRAW_NEVER"
	bool m_bReverseHudProgressBar;
	CUtlString m_strSmallIconCssClass;
	CUtlString m_strHintText;
	// MPropertyDescription = "When set, different modifiers from the same ability will collapse based on this ID."
	CUtlString m_strModifierOverrideStatusID;
	CPanoramaImageName m_strHudIcon;
	HudDisplayLocation_t m_eHudDisplayLocation; // = "DISPLAY_HUD_LEFT"
	ModifiersDisplayLocation_t m_eModifierDisplayLocaiton; // = "MODIFIER_DISPLAY_LOCAITON_ALL"
	// MPropertyDescription = "When set, the message will appear in the middle of the HUD for the target player."
	CUtlString m_strHudMessageText;
	// MPropertyDescription = "When set, the modifier will not be visible overhead of the casting player for the other players"
	bool m_bIsHiddenOverhead;
	// MPropertyDescription = "A list of modifier value stats to show in the UI (if empty, will show everything)"
	CUtlVector< EModifierValue > m_vecAlwaysShowInStatModifierUI;
	// MPropertyDescription = "When set, this modifier is left out of the active stat rows entirely.  For buffs that already present themselves with their own HUD entry and would otherwise be listed twice."
	bool m_bHideInStatModifierUI;
	// MPropertyStartGroup = "Responses"
	CCitadelModifierResponseRules_t m_OnCreateResponse; // = { "m_Criteria": {  }, "m_nConcept": "CITADEL_CONCEPT_NONE", "m_nFilterType": "MODIFIER_RR_FILTER_BROADCAST", "m_nSpeakerType": "MODIFIER_RR_SPEAKER_PARENT" }
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceCreated; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyDescription = "By default, we stop the sequence from 'Sequence Created' once the modifier is removed.  Un-check this to allow it to continue past the modifier's lifetime."
	bool m_bEndCreatedSequenceOnRemove; // = true
	CitadelCameraOperationsSequence_t m_cameraSequenceRemoved; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Barrier"
	ModifierBarrierBehavior_t m_BarrierBehavior; // = "MODIFIER_BARRIER_BEHAVIOR_KEEP_ON_DESTROY"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BarrierCreateParticle;
	bool m_bSupressDefaultBarrierBreakParticle;
	bool m_bSuppressBarrierRefreshSound;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sExpiredSound;
	// MPropertyDescription = "Overrides the default footstep. The footstep with the greatest Priority is selected. It must have a priority greater than -1 to be selected!"
	FootstepSound_t m_FootstepOverride; // = { "m_nFootstepPriority": -1, "m_sFootstepSound": "" }
	// MPropertyDescription = "Plays alongside the default footstep."
	CSoundEventName m_FootstepAdditional;
	bool m_bRemoveOnInterrupted;
};
