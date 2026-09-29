// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_Pickup_VData",
//	"m_friendlyParticle": "",
//	"m_enemyParticle": "",
//	"m_friendlyModelParticle": "",
//	"m_enemyModelParticle": "",
//	"m_friendlyInteractiveParticle": "",
//	"m_enemyInteractiveParticle": "",
//	"m_gainedParticle": "",
//	"m_vacuumStartParticle": "",
//	"m_Color":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_hModel": "",
//	"m_bShowModelOverhead": true,
//	"m_sDefaultMaterialGroupName": "",
//	"m_sVacuumAttachmentTarget": "ability_apply",
//	"m_sNameLocString": "",
//	"m_nNameOffset": 60,
//	"m_bShowOnMinimap": false,
//	"m_bIsPermanentPickup": false,
//	"m_sBuffTypeLocString": "",
//	"m_BuffTypeGraphColor":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_eBuffTypeValueUnit": "Flat",
//	"m_iTempParticleSheetIndex": -1,
//	"m_flParticleRadius": 80.000000,
//	"m_strMinimapClass": "",
//	"m_strPingIcon": "",
//	"m_sPickupSound": "",
//	"m_strGainedSound": "",
//	"m_sSpawnSound": "",
//	"m_sBecomeInteractiveSound": "",
//	"m_strVacuumStartSound": "",
//	"m_sAmbientSound": "",
//	"m_sHitSound": "",
//	"m_eCollectionMethod": "Touch",
//	"m_bGiveToWholeTeam": false,
//	"m_flPickupRadius":
//	{
//		"m_flBase": 0.000000,
//		"m_flPerMinuteAfterStart": 0.000000,
//		"m_flStartMinute": 0.000000,
//		"m_flMaxValue": 0.000000
//	},
//	"m_bLosCheckOnTouchRadius": false,
//	"m_bPickupExpires": true,
//	"m_flPickupExpirationDuration":
//	{
//		"m_flBase": 0.000000,
//		"m_flPerMinuteAfterStart": 0.000000,
//		"m_flStartMinute": 0.000000,
//		"m_flMaxValue": 0.000000
//	},
//	"bPhysicallyDropToTheGroundOnSpawn": false,
//	"m_flSolidRadius": 5.000000,
//	"m_fInitialSpawnXYSpeed": 0.000000,
//	"m_fInitialSpawnZSpeed":
//	[
//		100.000000,
//		200.000000
//	],
//	"m_flFallGravity": 1.000000,
//	"m_flHoverOffset": 0.000000,
//	"m_iHitsRequired": 1,
//	"m_bHeavyMeleeOnly": true,
//	"m_flCollisionRadius": 40.000000,
//	"m_flCenterHeightOffset": 40.000000,
//	"m_ParryCheckModifier":
//	{
//	},
//	"m_bPicupIsVacuum": false,
//	"m_flInitialVacuumSideSpeed":
//	[
//		50.000000,
//		100.000000
//	],
//	"m_flInitialVacuumUpSpeed":
//	[
//		10.000000,
//		100.000000
//	],
//	"m_VacuumToPlayerSpeedCurve":
//	{
//		"m_spline":
//		[
//		],
//		"m_tangents":
//		[
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			0.000000,
//			0.000000
//		]
//	},
//	"m_VacuumInitialVelSpeedCurve":
//	{
//		"m_spline":
//		[
//		],
//		"m_tangents":
//		[
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			0.000000,
//			0.000000
//		]
//	},
//	"m_flVacuumCloseEnoughToPickup": 5.000000,
//	"m_EffectDistanceToRadiusRemap":
//	[
//		300.000000,
//		0.000000,
//		1.000000,
//		0.200000
//	],
//	"m_bSameTeamOnly": false,
//	"m_flOutlineRange": -1.000000,
//	"m_OutlineColor":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_AuraModifier":
//	{
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_Pickup_VData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	// MPropertyFriendlyName = "Spawn Particle"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_friendlyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_enemyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_friendlyModelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_enemyModelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_friendlyInteractiveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_enemyInteractiveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_gainedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_vacuumStartParticle;
	// MPropertyFriendlyName = "Spawn Particle Color"
	// MPropertyDescription = "Spawn Particle Color"
	Color m_Color;
	// MPropertyDescription = "Model"
	// MPropertyProvidesEditContextString = "ToolEditContext_ID_VMDL"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	bool m_bShowModelOverhead;
	// MPropertyFriendlyName = "Material group"
	// MPropertyDescription = "Which material group of the model should be used?"
	CModelMaterialGroupName m_sDefaultMaterialGroupName;
	// MPropertyFriendlyName = "VMDL Attachment to Vacuum to"
	CUtlString m_sVacuumAttachmentTarget;
	// MPropertyStartGroup = ""
	// MPropertyFriendlyName = "Pickup Name Loc String"
	CUtlString m_sNameLocString;
	int32 m_nNameOffset;
	// MPropertyFriendlyName = "Show On Minimap"
	bool m_bShowOnMinimap;
	bool m_bIsPermanentPickup;
	// MPropertyFriendlyName = "Buff Type Loc String"
	// MPropertyDescription = "Permanent pickups sharing this string are grouped as one buff type in the postgame Permanent Buffs graph"
	// MPropertySuppressExpr = "m_bIsPermanentPickup == false"
	CUtlString m_sBuffTypeLocString;
	// MPropertyFriendlyName = "Buff Type Graph Color"
	// MPropertyDescription = "Line color for this buff type in the postgame Permanent Buffs graph"
	// MPropertySuppressExpr = "m_bIsPermanentPickup == false"
	Color m_BuffTypeGraphColor;
	// MPropertyFriendlyName = "Buff Type Value Unit"
	// MPropertyDescription = "How this buff's stat value is displayed in the postgame Permanent Buffs graph. Meters converts from engine units."
	// MPropertySuppressExpr = "m_bIsPermanentPickup == false"
	EPermanentBuffValueUnit m_eBuffTypeValueUnit;
	int32 m_iTempParticleSheetIndex;
	float32 m_flParticleRadius;
	CUtlString m_strMinimapClass;
	// MPropertyFriendlyName = "Ping Icon"
	// MPropertyDescription = "Icon passed into chat bubble when pinged."
	CPanoramaImageName m_strPingIcon;
	// MPropertyStartGroup = "Audio"
	// MPropertyFriendlyName = "Pickup Sound"
	CSoundEventName m_sPickupSound;
	CSoundEventName m_strGainedSound;
	// MPropertyFriendlyName = "Spawn Sound"
	CSoundEventName m_sSpawnSound;
	// MPropertyFriendlyName = "Become Interactive Sound"
	CSoundEventName m_sBecomeInteractiveSound;
	// MPropertyFriendlyName = "Vacuum Start Sound"
	// MPropertyDescription = "Sound that plays when vacuuming starts and only for the vacuuming player"
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CSoundEventName m_strVacuumStartSound;
	// MPropertyFriendlyName = "Ambient Sound"
	CSoundEventName m_sAmbientSound;
	// MPropertyFriendlyName = "On Punched Sound"
	// MPropertySuppressExpr = "m_eCollectionMethod != Punch"
	CSoundEventName m_sHitSound;
	// MPropertyStartGroup = ""
	// MPropertyDescription = "Determines how players collect the rewards from this pickup"
	EPickupCollectionMethod m_eCollectionMethod;
	// MPropertyDescription = "When true, everyone on the picker upper's team gets the reward"
	bool m_bGiveToWholeTeam;
	// MPropertyFriendlyName = "Pickup Radius"
	TimeScalingValue_t m_flPickupRadius;
	bool m_bLosCheckOnTouchRadius;
	// MPropertyFriendlyName = "Pickup Expiration Duration"
	bool m_bPickupExpires;
	TimeScalingValue_t m_flPickupExpirationDuration;
	// MPropertyDescription = "When true, don't allow collection until we've fallen to the ground"
	bool bPhysicallyDropToTheGroundOnSpawn;
	// MPropertyStartGroup = "Fall To Ground Settings"
	// MPropertyDescription = "Radius when solid and falling to the ground"
	// MPropertySuppressExpr = "bPhysicallyDropToTheGroundOnSpawn == false"
	float32 m_flSolidRadius;
	// MPropertySuppressExpr = "bPhysicallyDropToTheGroundOnSpawn == false"
	CRangeFloat m_fInitialSpawnXYSpeed;
	// MPropertySuppressExpr = "bPhysicallyDropToTheGroundOnSpawn == false"
	CRangeFloat m_fInitialSpawnZSpeed;
	// MPropertySuppressExpr = "bPhysicallyDropToTheGroundOnSpawn == false"
	float32 m_flFallGravity;
	// MPropertyDescription = "Optionally how far to hover off the ground"
	// MPropertySuppressExpr = "bPhysicallyDropToTheGroundOnSpawn == false"
	float32 m_flHoverOffset;
	// MPropertyStartGroup = ""
	// MPropertyStartGroup = "Punch Settings"
	// MPropertySuppressExpr = "m_eCollectionMethod != Punch"
	int32 m_iHitsRequired;
	// MPropertySuppressExpr = "m_eCollectionMethod != Punch"
	bool m_bHeavyMeleeOnly;
	// MPropertySuppressExpr = "m_eCollectionMethod != Punch"
	float32 m_flCollisionRadius;
	// MPropertySuppressExpr = "m_eCollectionMethod != Punch"
	float32 m_flCenterHeightOffset;
	CEmbeddedSubclass< CBaseModifier > m_ParryCheckModifier;
	// MPropertyStartGroup = ""
	// MPropertyDescription = "When true, the pickup will vacuum to the first player that gets within the pickup radius"
	bool m_bPicupIsVacuum;
	// MPropertyStartGroup = "Vacuum Settings"
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CRangeFloat m_flInitialVacuumSideSpeed;
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CRangeFloat m_flInitialVacuumUpSpeed;
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CPiecewiseCurve m_VacuumToPlayerSpeedCurve;
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CPiecewiseCurve m_VacuumInitialVelSpeedCurve;
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	float32 m_flVacuumCloseEnoughToPickup;
	// MPropertySuppressExpr = "m_bPicupIsVacuum == false"
	CRemapFloat m_EffectDistanceToRadiusRemap;
	// MPropertyStartGroup = ""
	// MPropertyDescription = "When set, only exists for the team the pickup is on"
	bool m_bSameTeamOnly;
	// MPropertyStartGroup = "Outline"
	float32 m_flOutlineRange;
	// MPropertyColorPlusAlpha
	Color m_OutlineColor;
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
};
