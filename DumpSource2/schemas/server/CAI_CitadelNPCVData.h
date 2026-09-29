// MGetKV3ClassDefaults = {
//	"_class": "CAI_CitadelNPCVData",
//	"m_sModelName": "",
//	"m_hFootstepSounds": "",
//	"m_vecNavLinkMovementNames":
//	[
//	],
//	"m_flAimConeAngle": 6.000000,
//	"m_nMaxHealth": 100,
//	"m_vecIntrinsicModifiers":
//	[
//	],
//	"m_vecIntrinsicModifiersByName":
//	[
//	],
//	"m_statusEffectMap":
//	{
//	},
//	"m_vecAttachments":
//	[
//	],
//	"m_bTakesDamage": true,
//	"m_strDamagedEffect": "",
//	"m_nRagdollHealth": 0,
//	"m_flImpactEnergyScale": 1.000000,
//	"m_bAllowNonZUpMovement": false,
//	"m_vecObstacleNavLinks":
//	[
//	],
//	"m_bUseDynamicCollisionHull": false,
//	"m_bRequestCapsuleCollision": false,
//	"m_flCapsuleRadiusOverride": 0.000000,
//	"m_flCapsuleHeightOverride": 0.000000,
//	"m_vecActionDesiredShared":
//	[
//	],
//	"m_sPlayerKilledNpcSound": "",
//	"m_sDefaultMovementSettings": "",
//	"m_mappedMovementSettings":
//	[
//	],
//	"m_bEnableCodeDrivenAnimgraphMovement": false,
//	"m_bEnableAnimgraphTagDrivenStrafing": true,
//	"m_flMassOverride": -1.000000,
//	"m_mapBoundAbilities":
//	{
//	},
//	"m_bSpawnOnGround": false,
//	"m_flSightRangePlayers": 0.000000,
//	"m_flSightRangeNPCs": 0.000000,
//	"m_MeleeAnimName": "",
//	"m_flMeleeAttemptRange": 80.000000,
//	"m_flMeleeHitRange": 80.000000,
//	"m_flWalkSpeed": 300.000000,
//	"m_flRunSpeed": 300.000000,
//	"m_flStrafeSpeed": 100.000000,
//	"m_flTurnRate": 180.000000,
//	"m_flAcceleration": 200.000000,
//	"m_flStepHeight": 36.000000,
//	"m_flJumpAnticipationTime": 0.600000,
//	"m_flJumpUpBaseCostSeconds": 2.000000,
//	"m_FlightMotion":
//	{
//		"m_flFlightSpeed": 300.000000,
//		"m_flSquiggleMotionScale": 1.000000,
//		"m_flSquiggleMotionAmplitude":
//		[
//			25.000000,
//			80.000000
//		],
//		"m_flSquiggleMotionRandomizeInterval":
//		[
//			0.500000,
//			1.000000
//		]
//	},
//	"m_flSquadDistance": 40.000000,
//	"m_sAnimGraphIdentifier": "",
//	"m_MovementBlockedClips":
//	[
//	],
//	"m_HitReactClips":
//	[
//	],
//	"m_BeamStartSound": "",
//	"m_BeamStopSound": "",
//	"m_BeamPointStartLoopSound": "",
//	"m_BeamPointEndLoopSound": "",
//	"m_BeamPointClosestLoopSound": "",
//	"m_strAmbientLoopSound": "",
//	"m_DeathSound": "",
//	"m_strLastHitSound": "",
//	"m_flLastHitSoundWindowTime": 1.000000,
//	"m_MeleeHitSound": "",
//	"m_strMeleeAttackSound": "",
//	"m_sAmberModelName": "",
//	"m_sSapphireModelName": "",
//	"m_bUseTeamRelativeMaterialGroups": true,
//	"m_sDefaultMaterialGroupName": "",
//	"m_sEnemyMaterialGroupName": "",
//	"m_sTeam1MaterialGroupName": "",
//	"m_sTeam2MaterialGroupName": "",
//	"m_MeleeSwingParticle": "",
//	"m_MeleeActivateParticle": "",
//	"m_flModelScale": 1.000000,
//	"m_DeathParticle": "",
//	"m_JumpParticle": "",
//	"m_flOutlineRange": 2000.000000,
//	"m_flOutlineWidth": 4.000000,
//	"m_bOutlineThroughWalls": false,
//	"m_bOutlineWhenVisible": false,
//	"m_bSuppressOtherOutlinesWhenVisible": false,
//	"m_flMaxHealthBarDrawDistance": 0.000000,
//	"m_HealthBarParticle": "",
//	"m_sLocUnitName": "",
//	"m_sHealthBarAttachment": "",
//	"m_HealthBarColorFriend":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_HealthBarColorEnemy":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_HealthBarColorTeam1":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_HealthBarColorTeam2":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_HealthBarColorTeamNeutral":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_strCustomUnitIcon": "",
//	"m_bTrackOutOfCombatStatus": false,
//	"m_NpcOutOfCombatModifier":
//	{
//	},
//	"m_NpcInCombatModifier":
//	{
//	},
//	"m_flMeleeTargetRadius": 0.000000,
//	"m_bSpawnBreakablesOnDeath": false,
//	"m_flBreakableForceScale": 1.000000,
//	"m_flPhysicsImpulseMultiplier": 1.000000,
//	"m_flBeamWeaponWidth": 1.000000,
//	"m_flBeamTurnRate": 90.000000,
//	"m_BeamWeaponParticle": "",
//	"m_mapWeaponInfos":
//	{
//	},
//	"m_bDamageBreakableWithMelee": false,
//	"m_nSquadPriority": 0
//}
// MHasKV3TransferPolymorphicClassname
class CAI_CitadelNPCVData : public CAI_BaseNPCVData
{
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapBoundAbilities;
	bool m_bSpawnOnGround;
	// MPropertyStartGroup = "Ranges"
	float32 m_flSightRangePlayers;
	float32 m_flSightRangeNPCs;
	CGlobalSymbol m_MeleeAnimName;
	float32 m_flMeleeAttemptRange;
	float32 m_flMeleeHitRange;
	// MPropertyStartGroup = "Movement"
	float32 m_flWalkSpeed;
	float32 m_flRunSpeed;
	float32 m_flStrafeSpeed;
	float32 m_flTurnRate;
	float32 m_flAcceleration;
	float32 m_flStepHeight;
	float32 m_flJumpAnticipationTime;
	float32 m_flJumpUpBaseCostSeconds;
	NPCFlightMotion_t m_FlightMotion;
	float32 m_flSquadDistance;
	// MPropertyStartGroup = "Animation"
	CGlobalSymbol m_sAnimGraphIdentifier;
	CUtlVector< NPCMovementBlockedClip_t > m_MovementBlockedClips;
	CUtlVector< NPCHitReactClip_t > m_HitReactClips;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BeamStartSound;
	CSoundEventName m_BeamStopSound;
	CSoundEventName m_BeamPointStartLoopSound;
	CSoundEventName m_BeamPointEndLoopSound;
	CSoundEventName m_BeamPointClosestLoopSound;
	CSoundEventName m_strAmbientLoopSound;
	CSoundEventName m_DeathSound;
	CSoundEventName m_strLastHitSound;
	float32 m_flLastHitSoundWindowTime;
	CSoundEventName m_MeleeHitSound;
	CSoundEventName m_strMeleeAttackSound;
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "When set, uses this model when on the Amber team.  Falls back to Model Name if not set"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sAmberModelName;
	// MPropertyDescription = "When set, uses this model when on the Sapphire team.  Falls back to Model Name if not set"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sSapphireModelName;
	bool m_bUseTeamRelativeMaterialGroups;
	CModelMaterialGroupName m_sDefaultMaterialGroupName;
	CModelMaterialGroupName m_sEnemyMaterialGroupName;
	// MPropertyFriendlyName = "Amber Material Group Name"
	CModelMaterialGroupName m_sTeam1MaterialGroupName;
	// MPropertyFriendlyName = "Sapphire Material Group Name"
	CModelMaterialGroupName m_sTeam2MaterialGroupName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeActivateParticle;
	float32 m_flModelScale;
	// MPropertyDescription = "Particle to play instead of doing a ragdoll"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JumpParticle;
	// MPropertyStartGroup = "Outline"
	float32 m_flOutlineRange;
	float32 m_flOutlineWidth;
	// MPropertyDescription = "Whether to show an outline through walls"
	bool m_bOutlineThroughWalls;
	// MPropertyDescription = "Whether to show an outline when visible"
	bool m_bOutlineWhenVisible;
	// MPropertyDescription = "If not showing an outline, whether to hide / suppress other outlines through this object."
	bool m_bSuppressOtherOutlinesWhenVisible;
	// MPropertyStartGroup = "Health Bar"
	float32 m_flMaxHealthBarDrawDistance;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealthBarParticle;
	CUtlString m_sLocUnitName;
	CUtlString m_sHealthBarAttachment;
	Color m_HealthBarColorFriend;
	Color m_HealthBarColorEnemy;
	Color m_HealthBarColorTeam1;
	Color m_HealthBarColorTeam2;
	Color m_HealthBarColorTeamNeutral;
	// MPropertyDescription = "When set, uses this as a custom icon for the unit, currently only used for precaching references in code."
	CPanoramaImageName m_strCustomUnitIcon;
	// MPropertyStartGroup = "Modifiers"
	bool m_bTrackOutOfCombatStatus;
	CEmbeddedSubclass< CCitadelModifier > m_NpcOutOfCombatModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NpcInCombatModifier;
	// MPropertyStartGroup = "Misc"
	// MPropertyDescription = "Extra distance that a melee attacking npc can hit this npc from. Useful for medium and larger npcs."
	float32 m_flMeleeTargetRadius;
	// MPropertyDescription = "When true, spawns breakables defined in the model"
	bool m_bSpawnBreakablesOnDeath;
	// MPropertySuppressExpr = "m_bSpawnBreakablesOnDeath == false"
	float32 m_flBreakableForceScale;
	// MPropertyDescription = "Modifier for physics impulses applied to this NPC (0 == unmoveable)"
	float32 m_flPhysicsImpulseMultiplier;
	// MPropertyStartGroup = "Beam Weapon"
	float32 m_flBeamWeaponWidth;
	float32 m_flBeamTurnRate;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamWeaponParticle;
	// MPropertyStartGroup = "Combat"
	// MPropertyFriendlyName = "Weapon Infos"
	// MPropertyDescription = "Weapon infos keyed by context. The "primary" context is what GetWeaponInfoVData() returns by default."
	CUtlOrderedMap< CGlobalSymbol, CCitadelWeaponInfo > m_mapWeaponInfos;
	bool m_bDamageBreakableWithMelee;
	int32 m_nSquadPriority;
};
