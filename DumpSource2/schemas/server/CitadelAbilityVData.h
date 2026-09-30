// MVDataOverlayType = 2
// MHasKV3TransferPolymorphicClassname
class CitadelAbilityVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Meta"
	EAbilityType_t m_eAbilityType; // = "EAbilityType_Invalid"
	// MPropertyStartGroup = "Meta"
	EItemSlotTypes_t m_eItemSlotType; // = "EItemSlotType_Invalid"
	bool m_bDisabled;
	bool m_bDisabledOnExperimental;
	bool m_bInDevelopment;
	bool m_bStartTrained;
	int32 m_iMaxLevel; // = 1
	int32 m_nAbilityPointsCost;
	int32 m_nAbillityUnlocksCost;
	uint64 m_iUpdateTime;
	// MPropertyStartGroup = "Behavior"
	CBitVecEnum< EAbilityBehavior_t > m_AbilityBehaviorsBits;
	// MPropertyDescription = "The location for our ability's targeting to use, used in GetCastPosition and such.  Also determines preview visuals."
	EAbilityTargetingLocation_t m_eAbilityTargetingLocation; // = "CITADEL_ABILITY_TARGETING_LOCATION_NONE"
	// MPropertyDescription = "The general shape that our ability will target. Unless you choose cone targeting, it ONLY determines preview visuals - you still have to do the targeting separately in code."
	EAbilityTargetingShape_t m_eAbilityTargetingShape; // = "CITADEL_ABILITY_TARGETING_SHAPE_NONE"
	// MPropertySuppressExpr = "m_eAbilityTargetingShape != CITADEL_ABILITY_TARGETING_SHAPE_CONE"
	float32 m_flTargetingConeAngle;
	// MPropertySuppressExpr = "m_eAbilityTargetingShape != CITADEL_ABILITY_TARGETING_SHAPE_CONE"
	float32 m_flTargetingConeHalfWidth; // = 10
	// MPropertyDescription = "When true, we will do an extra trace with the same cone shape, but with the cone laying flat in XY"
	// MPropertySuppressExpr = "m_eAbilityTargetingShape != CITADEL_ABILITY_TARGETING_SHAPE_CONE"
	bool m_bIncludeExtra2DCone; // = true
	// MPropertySuppressExpr = "m_eAbilityTargetingShape != CITADEL_ABILITY_TARGETING_SHAPE_CONE"
	// MPropertyDescription = "When true, the cone is cast from the center of the screen, rather than from the center of the character."
	bool m_bUseCameraOffsetsForCone; // = true
	// MPropertySuppressExpr = "m_eAbilityTargetingShape != CITADEL_ABILITY_TARGETING_SHAPE_CONE"
	// MPropertyDescription = "When true, the cone collects nearby targets as well, helpful for melee attacks."
	bool m_bCollectNearbyTargetsWithCone;
	// MPropertySuppressExpr = "m_bCollectNearbyTargetsWithCone == false"
	float32 m_flNearbySweepOffset; // = -59
	// MPropertySuppressExpr = "m_bCollectNearbyTargetsWithCone == false"
	float32 m_flNearbySweepRadius; // = 78
	// MPropertyDescription = "When false, the targeting preview draws its shape but leaves the rest of the screen alone."
	bool m_bTargetingPreviewDesaturatesScreen; // = true
	EAbilityActivation_t m_eAbilityActivation; // = "CITADEL_ABILITY_ACTIVATION_NONE"
	float32 m_flToggleOffDelay;
	// MPropertyDescription = "If set, this button must be down in addition to our trigger button (be default the slot button) in order to activate this ability."
	InputBitMask_t m_TriggerButtonPreReqButton;
	// MPropertyDescription = "If set, this is the button requierd to be pressed to activate this ability."
	InputBitMask_t m_TriggerButtonOverride;
	EAbilitySpectatePriority m_eAbilitySpectatePriority; // = "CITADELTV_ABILITY_SPECTATE_PRIORITY_NONE"
	CBitVecEnum< EModifierState > m_bitsInterruptingStates;
	IncompatibleFilter_t m_IncompatibleFilter; // = { "m_AbilityBehaviorsBits": "", "m_eAbilityActivation": "CITADEL_ABILITY_ACTIVATION_NONE", "m_eIncompatibleAbilityType": "EAbilityType_Invalid" }
	CITADEL_UNIT_TARGET_TYPE m_nAbilityTargetTypes;
	CITADEL_UNIT_TARGET_FLAGS m_nAbilityTargetFlags;
	ELOSCheck m_eTargettingLOSCheck; // = "Bounds"
	// MPropertyDescription = "During pre-cast, what modifier states are set."
	CBitVecEnum< EModifierState > m_bitsPreCastEnabledStateMask;
	// MPropertyDescription = "During channel, what modifier states are set."
	CBitVecEnum< EModifierState > m_bitsChannelEnabledStateMask;
	// MPropertyDescription = "During post-cast, what modifier states are set."
	CBitVecEnum< EModifierState > m_bitsPostCastEnabledStateMask;
	// MPropertyDescription = "This ability provides these types of ability target effects."
	ECitadelTargetAbilityEffects m_TargetAbilityEffectsToApply;
	// MPropertyDescription = "Scale Damage to Objectives by this amount"
	float32 m_flBossDamageScale; // = 1
	bool m_bShowTargetingPreviewWhileChanneling;
	bool m_bShowTargetingPreviewWhileCasting;
	// MPropertyStartGroup = ""
	// MPropertyFriendlyName = "Weapon Infos"
	// MPropertyDescription = "Weapon infos keyed by context. The "primary" context is what GetWeaponInfoVData() returns by default."
	CUtlOrderedMap< CGlobalSymbol, CCitadelWeaponInfo > m_mapWeaponInfos;
	// MPropertyFriendlyName = "Projectile Info"
	ProjectileInfo_t m_projectileInfo; // = { "m_AutoProjectileModifier": {  }, "m_DetonateSound": "", "m_HitSound": "", "m_HitTargetSound": "", "m_HitWorldSound": "", "m_LoopingSound": "", "m_WarningSound": "", "m_bAllowMotionDuringNoCollisionDuration": false, "m_bHideWarningParticle": false, "m_customModel": "", "m_eProjectileShape": "Sphere", "m_flBulletOnlyTriggerRadius": 0, "m_flCapsulePhysicsRadius": 1.5, "m_flCapsuleTriggerRadius": 1.5, "m_flElasticity": 0, "m_flFriction": 0, "m_flGravityScale": 1, "m_flMaxLinearRange": 0, "m_flNoCollisionDuration": 0, "m_flPhysicsRadius": 1.5, "m_flProjectileModelScale": 1, "m_flSpeed": 3500, "m_flTrackingDampingCoefficient": 0, "m_flTrackingDuration": 0, "m_flTrackingEndTime": 0, "m_flTrackingStartTime": 0, "m_flTriggerRadius": 1.5, "m_flUpSpeed": 100, "m_flVerticalAimBias": 0, "m_nBehaviors": "", "m_particle": "", "m_vecCapsulePhysicsCenter1": [ 0, 0, 0 ], "m_vecCapsulePhysicsCenter2": [ 0, 0, 0 ], "m_vecCapsuleTriggerCenter1": [ 0, 0, 0 ], "m_vecCapsuleTriggerCenter2": [ 0, 0, 0 ], "m_warningParticle": "" }
	// MPropertyFriendlyName = "Deployment Info"
	DeploymentInfo_t m_deploymentInfo; // = { "m_bCheckPlayerFit": false, "m_bDownCheckIgnoreLos": false, "m_bGroundCheck": false, "m_bPlaceFlat": false, "m_bPlaceNormalToSurface": false, "m_bPointTrace": false, "m_bRequiresUpNormal": false, "m_flFlatYawOffset": 0, "m_flGroundCheckHeightOffset": -1, "m_flGroundCheckHeightOffsetDown": -1, "m_flModelVerticalPlacementScaleOffset": 0, "m_flPreviewModelScale": 1, "m_previewModel": "", "m_previewParticle": "", "m_strExraBodygroup": "", "m_strPreviewClass": "citadel_deployable_preview", "m_strPreviewParticleEffectConfig": "" }
	// MPropertyStartGroup = ""
	CUtlDict< CitadelAbilityProperty_t > m_mapAbilityProperties;
	// MPropertyMapKeyLeafChoiceProviderFn
	CUtlOrderedMap< CSubclassName< 4 >, AbilityDependencyDescription_t > m_mapDependentAbilities;
	CUtlVector< AbilityUpgrade_t > m_vecAbilityUpgrades;
	// MPropertyStartGroup = "AnimGraph2"
	// MPropertyDescription = "When true, suppress the out of combat anim state for 2s on cast."
	bool m_bSuppressOutOfCombatOnCast; // = true
	// MPropertyDescription = "When true, suppress the out of combat anim state while channeling and for 2s after."
	bool m_bSuppressOutOfCombatWhileChanneling; // = true
	// MPropertyFriendlyName = "hero_action_source value when doing an action"
	// MPropertyDescription = "By default uses the ability name.  Set this to use a custom name."
	CGlobalSymbol m_strAG2SourceName;
	// MPropertyFriendlyName = "Casting "hero_action" value"
	// MPropertyDescription = "Value to set "hero_action" to set when casting. "hero_action_source" will be set to this ability's name"
	CGlobalSymbol m_strAG2CastingAction; // = "casting"
	// MPropertyFriendlyName = "Channeling "hero_action" value"
	// MPropertyDescription = "Value to set "hero_action" to set when channeling. "hero_action_source" will be set to this ability's name"
	CGlobalSymbol m_strAG2ChannelingAction; // = "channeling"
	// MPropertyFriendlyName = "Cast Completed "hero_action" value"
	// MPropertyDescription = "Value to set "hero_action" to when casting completes. "hero_action_source" will be set to this ability's name"
	CGlobalSymbol m_strAG2CastCompletedAction; // = "cast_completed"
	// MPropertyFriendlyName = "Cast Fail "hero_action" value"
	// MPropertyDescription = "Value to set "hero_action" to when casting fails for any reason. "hero_action_source" will be set to this ability's name"
	CGlobalSymbol m_strAG2CastFailedAction;
	// MPropertyStartGroup = "UI"
	// MPropertySuppressExpr = "m_bIsSignatureAbility == false"
	AbilityTooltipDetails_t m_AbilityTooltipDetails;
	CUtlString m_strCSSClass;
	CPanoramaImageName m_strAbilityImage;
	CitadelAbilityHUDPanel_t m_HUDPanel;
	bool m_bShowInPassiveItemsArea;
	bool m_bForceHideHUDPanel;
	bool m_bForceShowHUDPanel;
	bool m_bUsesFlightControls;
	CUtlString m_strFlyUpLocString;
	CUtlString m_strFlyDownLocString;
	// MPropertyDescription = "Subcast UI will have this class set"
	CUtlString m_strSubCastUICSSClass;
	// MPropertyFriendlyName = "Custom Stacks Label"
	CUtlString m_sCustomStackLabel;
	// MPropertyDescription = "CSS stylesheet included in the HUD elements created by this ability"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCPanoramaStyle > > m_HudSharedStyle;
	// MPropertyFriendlyName = "Custom Layout Tooltip ID"
	CUtlString m_sCustomTooltipID;
	// MPropertyFriendlyName = "Custom Layout Tooltip Is Interactive"
	bool m_bCustomTooltipInteractive;
	// MPropertyFriendlyName = "Additional Abilities"
	AdditionalAbilities_t m_additionalAbilities;
	CUtlString m_strSecondaryStatName;
	// MPropertyDescription = "Used by button hints as labels for 'casting' (ex. cast, throw, deploy)."
	CUtlString m_strCastButtonLocToken;
	// MPropertyDescription = "Used by button hints as labels for 'alt-casting' (ex. cast on self, bring allies, heal teammate)."
	CUtlString m_strAltCastButtonLocToken;
	// MPropertyStartGroup = "Camera"
	// MPropertyDescription = "Camera sequence that plays when casting starts and stops when casting completes, unless the bool below is un-checked"
	CitadelCameraOperationsSequence_t m_cameraSequenceCastStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyDescription = "By default, we stop the sequence from 'Sequence Cast Start' once the cast completes successfully.  Un-check this to allow it to continue past the cast."
	bool m_bEndCastStartSequenceOnCastComplete; // = true
	// MPropertyDescription = "Camera sequence that plays when casting completes."
	CitadelCameraOperationsSequence_t m_cameraSequenceCastComplete; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyDescription = "Camera sequence that plays when channeling starts and is stopped when channeling ends, unless the bool below is un-checked."
	CitadelCameraOperationsSequence_t m_cameraSequenceChannelStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyDescription = "By default, we stop the sequence from 'Sequence Channel Start' once the channel completes successfully.  Un-check this to allow it to continue past the channel duration."
	bool m_bEndChannelStartSequenceOnChannelComplete; // = true
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Preview particle attaching to the caster before cast"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_previewParticle;
	// MPropertyDescription = "Name of particle control point config to use for preview particle effect (empty means use 'preview' config)"
	CUtlString m_strPreviewParticleEffectConfig;
	// MPropertyDescription = "Preview path particle shows ability's custom path"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PreviewPathParticle;
	// MPropertyDescription = "Whether or not our preview particles also use their corresponding sat shape."
	bool m_bUseSatShapesOnPreview; // = true
	// MPropertyDescription = "The preview used for AOE's. CP0 = effect position, CP1.X = aoe radius, CP15 = color Defaults if unset."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOEPreviewParticleOverride;
	// MPropertyDescription = "The preview used for cone targeting. CP0 = effect position, CP1 = cone left, CP2 = cone right, CP3 = cone center, CP15 = color. Defaults if unset."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ConePreviewParticleOverride;
	// MPropertyDescription = "The preview used for line-shaped abilities. CP0 = effect position, CP1 = end position, CP2.X = line radius. Defaults if unset."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LinePreviewParticleOverride;
	// MPropertyDescription = "Particle attaching to the caster on cast event"
	CUtlOrderedMap< AbilityCastEvent_t, CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > > m_mapCastEventParticles;
	// MPropertyDescription = "Trace particle when hit an enemy with targeted ability"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_skillshotHitParticle;
	// MPropertyDescription = "Trace particle when missed an enemy with targeted ability"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_skillshotMissParticle;
	// MPropertyDescription = "Preview particle on attaching to targets of this ability"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetingPreviewParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSelectedSound;
	CSoundEventName m_strUnselectedSound;
	CSoundEventName m_strSelectedLoopSound;
	CSoundEventName m_strCastSound;
	CSoundEventName m_strChannelSound;
	CSoundEventName m_strChannelLoopSound;
	CSoundEventName m_strCastDelaySound;
	CSoundEventName m_strCastDelayLoopSound;
	// MPropertyDescription = "plays for local player attacker dealing damage with this ability"
	CSoundEventName m_strHitConfirmationSound;
	// MPropertyDescription = "plays for local player victim taking damage from this ability"
	CSoundEventName m_strDamageTakenSound;
	CSoundEventName m_strAbilityOffCooldownSound;
	CSoundEventName m_strAbilityChargeReadySound;
	bool m_bPlayMeepMop; // = true
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_AutoChannelModifier;
	CEmbeddedSubclass< CBaseModifier > m_AutoCastDelayModifier;
	CUtlVector< CEmbeddedSubclass< CBaseModifier > > m_AutoIntrinsicModifiers;
	// MPropertySuppressExpr = "m_eAbilityType != EAbilityType_Cosmetic"
	AbilityCosmeticInfo_t m_cosmeticInfo;
	// MPropertySuppressExpr = "m_eAbilityType != EAbilityType_Cosmetic && m_eAbilityType != EAbilityType_Item"
	// MPropertyFriendlyName = "Item Tooltips"
	CUtlVector< ItemSectionInfo_t > m_vecTooltipSectionInfo;
};
