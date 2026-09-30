// MHasKV3TransferPolymorphicClassname
class CAI_CitadelNPCVData : public CAI_BaseNPCVData
{
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapBoundAbilities;
	bool m_bSpawnOnGround;
	// MPropertyStartGroup = "Ranges"
	float32 m_flSightRangePlayers;
	float32 m_flSightRangeNPCs;
	CGlobalSymbol m_MeleeAnimName;
	float32 m_flMeleeAttemptRange; // = 80
	float32 m_flMeleeHitRange; // = 80
	// MPropertyStartGroup = "Movement"
	float32 m_flWalkSpeed; // = 300
	float32 m_flRunSpeed; // = 300
	float32 m_flStrafeSpeed; // = 100
	float32 m_flTurnRate; // = 180
	float32 m_flAcceleration; // = 200
	float32 m_flStepHeight; // = 36
	float32 m_flJumpAnticipationTime; // = 0.6
	float32 m_flJumpUpBaseCostSeconds; // = 2
	NPCFlightMotion_t m_FlightMotion; // = { "m_flFlightSpeed": 300, "m_flSquiggleMotionAmplitude": [ 25, 80 ], "m_flSquiggleMotionRandomizeInterval": [ 0.5, 1 ], "m_flSquiggleMotionScale": 1 }
	float32 m_flSquadDistance; // = 40
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
	float32 m_flLastHitSoundWindowTime; // = 1
	CSoundEventName m_MeleeHitSound;
	CSoundEventName m_strMeleeAttackSound;
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "When set, uses this model when on the Amber team.  Falls back to Model Name if not set"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sAmberModelName;
	// MPropertyDescription = "When set, uses this model when on the Sapphire team.  Falls back to Model Name if not set"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sSapphireModelName;
	bool m_bUseTeamRelativeMaterialGroups; // = true
	CModelMaterialGroupName m_sDefaultMaterialGroupName;
	CModelMaterialGroupName m_sEnemyMaterialGroupName;
	// MPropertyFriendlyName = "Amber Material Group Name"
	CModelMaterialGroupName m_sTeam1MaterialGroupName;
	// MPropertyFriendlyName = "Sapphire Material Group Name"
	CModelMaterialGroupName m_sTeam2MaterialGroupName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeActivateParticle;
	float32 m_flModelScale; // = 1
	// MPropertyDescription = "Particle to play instead of doing a ragdoll"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JumpParticle;
	// MPropertyStartGroup = "Outline"
	float32 m_flOutlineRange; // = 2000
	float32 m_flOutlineWidth; // = 4
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
	float32 m_flBreakableForceScale; // = 1
	// MPropertyDescription = "Modifier for physics impulses applied to this NPC (0 == unmoveable)"
	float32 m_flPhysicsImpulseMultiplier; // = 1
	// MPropertyStartGroup = "Beam Weapon"
	float32 m_flBeamWeaponWidth; // = 1
	float32 m_flBeamTurnRate; // = 90
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamWeaponParticle;
	// MPropertyStartGroup = "Combat"
	// MPropertyFriendlyName = "Weapon Infos"
	// MPropertyDescription = "Weapon infos keyed by context. The "primary" context is what GetWeaponInfoVData() returns by default."
	CUtlOrderedMap< CGlobalSymbol, CCitadelWeaponInfo > m_mapWeaponInfos;
	bool m_bDamageBreakableWithMelee;
	int32 m_nSquadPriority;
};
