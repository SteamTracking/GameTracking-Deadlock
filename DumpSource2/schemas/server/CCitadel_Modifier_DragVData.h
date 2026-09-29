// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_Modifier_DragVData",
//	"m_flDuration": -1.000000,
//	"m_bKeepMaximumDurationOnRefresh": false,
//	"m_strParticleEffect": "",
//	"m_strParticleEffectConfig": "",
//	"m_strParticleStatusEffect": "",
//	"m_strParticleStatusEffectConfig": "",
//	"m_strScreenParticleEffect": "",
//	"m_strScreenParticleEffectConfig": "",
//	"m_nStatusEffectPriority": 0,
//	"m_vecRenderAttributes":
//	[
//	],
//	"m_sStartSound": "",
//	"m_sAmbientLoopingSound": "",
//	"m_nAmbientLoopingSoundSource": "MODIFIER_SOURCE_PARENT",
//	"m_nAmbientLoopingSoundRecipients": "MODIFIER_SOUND_RECIPIENT_ALWAYS",
//	"m_sEndSound": "",
//	"m_nEnabledStateMask": "",
//	"m_nDisabledStateMask": "",
//	"m_nAttributes": "",
//	"m_vecScriptValues":
//	[
//	],
//	"m_vecScriptEventHandlers":
//	[
//	],
//	"m_nDisableGroupsMask": "",
//	"m_bIsHidden": false,
//	"m_eHiddenType": "eHideAlways",
//	"m_sLocalizationName": "",
//	"m_eDebuffType": "MODIFIER_DEBUFF_ENEMY_TEAM_ONLY",
//	"m_bAutomaticallyDecayStacks": false,
//	"m_bAllowApplicationPrediction": true,
//	"m_bIsBuildup": false,
//	"m_bNetworkValuesForStatsPreview": false,
//	"m_vecAutoRegisterModifierValueFromAbilityPropertyName":
//	[
//	],
//	"m_bPersistWhileAbilityDormant": true,
//	"m_bCasterCountsAsAssister": true,
//	"m_flLingeringAssistWindow": 0.000000,
//	"m_bDurationCanBeTimeScaled": false,
//	"m_bDurationReducible": false,
//	"m_bDurationReducibleByCrowdControlDiminish": false,
//	"m_eTimeScaleSource": "MODIFIER_TIME_SCALE_USE_PARENT",
//	"m_bDurationAffectedByEffectiveness": false,
//	"m_AG2BaseAction":
//	{
//		"m_strParamName": "",
//		"m_nPriority": 0
//	},
//	"m_AG2BaseState":
//	{
//		"m_strParamName": "",
//		"m_nPriority": 0
//	},
//	"m_AG2HeroState":
//	{
//		"m_strParamName": "",
//		"m_nPriority": 0
//	},
//	"m_eDrawOverheadStatus": "OVERHEAD_DRAW_NEVER",
//	"m_bReverseHudProgressBar": false,
//	"m_strSmallIconCssClass": "",
//	"m_strHintText": "",
//	"m_strModifierOverrideStatusID": "",
//	"m_strHudIcon": "",
//	"m_eHudDisplayLocation": "DISPLAY_HUD_LEFT",
//	"m_eModifierDisplayLocaiton": "MODIFIER_DISPLAY_LOCAITON_ALL",
//	"m_strHudMessageText": "",
//	"m_bIsHiddenOverhead": false,
//	"m_vecAlwaysShowInStatModifierUI":
//	[
//	],
//	"m_bHideInStatModifierUI": false,
//	"m_OnCreateResponse":
//	{
//		"m_nConcept": "CITADEL_CONCEPT_NONE",
//		"m_Criteria":
//		{
//		},
//		"m_nFilterType": "MODIFIER_RR_FILTER_BROADCAST",
//		"m_nSpeakerType": "MODIFIER_RR_SPEAKER_PARENT"
//	},
//	"m_cameraSequenceCreated":
//	{
//		"m_strToken": "",
//		"m_bIsEmpty": false,
//		"m_nPriority": 1,
//		"m_vecDistanceOperations":
//		[
//		],
//		"m_vecFOVOperations":
//		[
//		],
//		"m_vecTargetPosOperations":
//		[
//		],
//		"m_vecVertOffsetOperations":
//		[
//		],
//		"m_vecHorizOffsetOperations":
//		[
//		]
//	},
//	"m_bEndCreatedSequenceOnRemove": true,
//	"m_cameraSequenceRemoved":
//	{
//		"m_strToken": "",
//		"m_bIsEmpty": false,
//		"m_nPriority": 1,
//		"m_vecDistanceOperations":
//		[
//		],
//		"m_vecFOVOperations":
//		[
//		],
//		"m_vecTargetPosOperations":
//		[
//		],
//		"m_vecVertOffsetOperations":
//		[
//		],
//		"m_vecHorizOffsetOperations":
//		[
//		]
//	},
//	"m_BarrierBehavior": "MODIFIER_BARRIER_BEHAVIOR_KEEP_ON_DESTROY",
//	"m_BarrierCreateParticle": "",
//	"m_bSupressDefaultBarrierBreakParticle": false,
//	"m_bSuppressBarrierRefreshSound": false,
//	"m_sExpiredSound": "",
//	"m_FootstepOverride":
//	{
//		"m_sFootstepSound": "",
//		"m_nFootstepPriority": -1
//	},
//	"m_FootstepAdditional": "",
//	"m_bRemoveOnInterrupted": false,
//	"m_LinkEffect": "",
//	"m_eOffsetBasis": "EDragOffset_SourceFacing",
//	"m_flDragDistance": 40.000000,
//	"m_flForwardOffset": 0.000000,
//	"m_flVerticalOffset": 0.000000,
//	"m_flHorizontalOffset": 0.000000,
//	"m_ePullModel": "EDragPull_SourceVelocityPlusDistance",
//	"m_flForceDistScale": 5.000000,
//	"m_flDampingFactor": 10.000000,
//	"m_flStuckDistance": 0.000000,
//	"m_bChaseAtLeastSourceSpeed": true,
//	"m_bBreakOnParentStunned": true,
//	"m_bZDownOnly": false,
//	"m_bLeaveGroundOnlyWhenPullingUp": false,
//	"m_bApplyDragStateFlagsToEnemies": true,
//	"m_bZeroVelocityOnEnd": true
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_DragVData : public CCitadel_Modifier_LinkVData
{
	// MPropertyStartGroup = "Drag - Hold Position"
	EDragOffsetBasis m_eOffsetBasis;
	float32 m_flDragDistance;
	float32 m_flForwardOffset;
	float32 m_flVerticalOffset;
	float32 m_flHorizontalOffset;
	// MPropertyStartGroup = "Drag - Pull"
	EDragPullModel m_ePullModel;
	float32 m_flForceDistScale;
	float32 m_flDampingFactor;
	// MPropertyDescription = "If the victim ends up further than this from the hold point it's probably wedged on something, so pull it towards the source's elevation instead.  Zero disables."
	float32 m_flStuckDistance;
	// MPropertyDescription = "Never chase slower than the source itself.  Off means a spring drag can be outrun, which is what you want when the drag is only meant to trail loosely."
	bool m_bChaseAtLeastSourceSpeed;
	// MPropertyStartGroup = "Drag - Behavior"
	// MPropertyDescription = "If true, remove ourselves when the parent gets stunned"
	bool m_bBreakOnParentStunned;
	// MPropertyDescription = "Only drag the victim downwards, and end the drag once it lands."
	bool m_bZDownOnly;
	// MPropertyDescription = "Only take the victim off the ground when the pull is upwards, so a level or downward drag still walks along the floor."
	bool m_bLeaveGroundOnlyWhenPullingUp;
	// MPropertyDescription = "Apply the standard drag debuff set (immobilize, silence, disarm) when the victim is an enemy."
	bool m_bApplyDragStateFlagsToEnemies;
	// MPropertyDescription = "Kill the victim's velocity when the drag ends.  Turn off if the drag wants to hand off momentum itself - Astro's lasso and Tengu's airlift keep the horizontal component."
	bool m_bZeroVelocityOnEnd;
};
