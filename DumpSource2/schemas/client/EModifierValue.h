enum EModifierValue : uint32_t
{
	MODIFIER_VALUE_MATERIAL_OVERRIDE = 0,
	// MPropertyFriendlyName = "ProcBuildupReceivedPercent"
	MODIFIER_VALUE_PROC_BUILDUP_RECEIVED_PERCENTAGE = 1,
	// MPropertyFriendlyName = "ProcBuildupAppliedPercent"
	MODIFIER_VALUE_PROC_BUILDUP_APPLIED_PERCENTAGE = 2,
	// MPropertyFriendlyName = "FrictionPercentage"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_FRICTION_PERCENTAGE = 3,
	// MPropertyFriendlyName = "BaseVelocity"
	// MScriptDescription = "GetModifierBaseVelocity"
	MODIFIER_VALUE_BASE_VELOCITY = 4,
	// MPropertyFriendlyName = "MoveType"
	// MScriptDescription = "GetMoveTypeOverride"
	MODIFIER_VALUE_MOVE_TYPE_OVERRIDE = 5,
	// MPropertyFriendlyName = "TargetIdentifierOverride"
	// MScriptDescription = "GetTargetIdentifierOverride"
	MODIFIER_VALUE_TARGET_IDENTIFIER_OVERRIDE = 6,
	// MPropertyFriendlyName = "TargetIdentifierOverrideOrientation"
	// MScriptDescription = "GetTargetIdentifierOverrideOrientation"
	MODIFIER_VALUE_TARGET_IDENTIFIER_OVERRIDE_ORIENTATION = 7,
	MODIFIER_VALUE_INCOMING_DAMAGE_PERCENTAGE = 8,
	// MScriptDescription = "GetModifierGravityScale"
	MODIFIER_VALUE_GRAVITY_SCALE = 9,
	// MPropertyFriendlyName = "BodyGroupChoice"
	// MScriptDescription = "GetBodyGroupChoice"
	MODIFIER_VALUE_BODY_GROUP_CHOICE_OVERRIDE = 10,
	// MPropertyFriendlyName = "Vehicle Top Speed Scale Override"
	// MScriptDescription = "GetVehicleTopSpeedScale"
	MODIFIER_VALUE_VEHICLE_TOP_SPEED_SCALE = 11,
	MODIFIER_VALUE_OUTGOING_DAMAGE_PERCENTAGE = 12,
	// MModifierValueCacheEnabled_IgnoreParams
	// MScriptDescription = "GetAdditionalVelocity"
	MODIFIER_VALUE_ADDITIONAL_VELOCITY = 13,
	// MPropertyFriendlyName = "Movement Gait Override"
	// MScriptDescription = "GetMovementGaitOverride"
	MODIFIER_VALUE_MOVEMENT_GAIT_OVERRIDE = 14,
	// MPropertyFriendlyName = "Movement Gait Set Override"
	// MScriptDescription = "GetMovementGaitSetOverride"
	MODIFIER_VALUE_MOVEMENT_GAIT_SET_OVERRIDE = 15,
	// MPropertyFriendlyName = "Stance Override"
	// MScriptDescription = "GetStanceOverride"
	MODIFIER_VALUE_STANCE_OVERRIDE = 16,
	// MPropertyDescription = "Flat Melee Damage given from boons that will be scaled by all increases and multipliers"
	MODIFIER_VALUE_BASE_MELEE_DAMAGE_FROM_LEVEL = 17,
	// MPropertyDescription = "Flat Bullet Damage given from boons that will be scaled by all increases and multipliers"
	MODIFIER_VALUE_BASE_BULLET_DAMAGE_FROM_LEVEL = 18,
	// MPropertyDescription = "Flat Alt-fire Bullet Damage given from boons that will be scaled by all increases and multipliers"
	MODIFIER_VALUE_BASE_BULLET_DAMAGE_FROM_LEVEL_ALT_FIRE = 19,
	// MPropertyDescription = "Bullet and Melee damage increase"
	MODIFIER_VALUE_WEAPON_DAMAGE_INCREASE = 20,
	// MPropertyDescription = "Bullet damage increase"
	MODIFIER_VALUE_BULLET_DAMAGE_INCREASE = 21,
	// MPropertyDescription = "Melee Damage increase"
	MODIFIER_VALUE_MELEE_DAMAGE_INCREASE = 22,
	// MPropertyDescription = "Bullet and Melee Damage increase at close range"
	MODIFIER_VALUE_CLOSE_RANGE_WEAPON_DAMAGE_INCREASE = 23,
	// MPropertyDescription = "Bullet Damage increase at long range"
	MODIFIER_VALUE_LONG_RANGE_BULLET_DAMAGE_INCREASE = 24,
	// MPropertyDescription = "All damage multiplier, after increases"
	MODIFIER_VALUE_ALL_DAMAGE_MULTIPLIER = 25,
	// MPropertyDescription = "Bullet damage multiplier, after increases"
	MODIFIER_VALUE_BULLET_DAMAGE_MULTIPLIER = 26,
	// MPropertyDescription = "Melee damage multiplier, after increases"
	MODIFIER_VALUE_MELEE_DAMAGE_MULTIPLIER = 27,
	// MPropertyDescription = "Tech damage multiplier, after increases"
	MODIFIER_VALUE_TECH_DAMAGE_MULTIPLIER = 28,
	// MPropertyDescription = "Flat bullet damage that is added after all the scaling is done."
	MODIFIER_VALUE_FLAT_BULLET_DAMAGE_POST_SCALE = 29,
	// MPropertyDescription = "All damage amplification on the target"
	MODIFIER_VALUE_ALL_DAMAGE_TAKEN_INCREASE = 30,
	// MPropertyDescription = "Bullet damage amplification on the target"
	MODIFIER_VALUE_BULLET_DAMAGE_TAKEN_INCREASE = 31,
	// MPropertyDescription = "Tech damage amplification on the target"
	MODIFIER_VALUE_TECH_DAMAGE_TAKEN_INCREASE = 32,
	// MPropertyDescription = "Tech Resist (positive)"
	MODIFIER_VALUE_TECH_RESIST = 33,
	// MPropertyDescription = "Tech Resist Reductions (negative)"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_TECH_RESIST_REDUCTION = 34,
	// MPropertyDescription = "Percent of the target's Spirit Resist that my spirit damage ignores"
	MODIFIER_VALUE_TECH_RESIST_PIERCING = 35,
	// MPropertyDescription = "Bullet Resist (positive)"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BULLET_ARMOR_DAMAGE_RESIST = 36,
	// MPropertyDescription = "Bullet Resist Reductions (negative)"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BULLET_AND_MELEE_RESIST_REDUCTION = 37,
	// MPropertyDescription = "Bullet resist against NPC"
	MODIFIER_VALUE_BULLET_RESIST_NON_HERO = 38,
	// MPropertyDescription = "Melee Resist (positive)"
	MODIFIER_VALUE_MELEE_RESIST = 39,
	// MPropertyDescription = "Melee Resist Reductions (negative)"
	MODIFIER_VALUE_MELEE_RESIST_REDUCTION = 40,
	// MPropertyDescription = "% damage reduction post armor, between 0 and -100, with -100 being 100% reduction"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_ABILITY_DAMAGE_REDUCTION_PERCENT = 41,
	// MPropertyDescription = "% damage reduction post armor, between 0 and -100, with -100 being 100% reduction"
	MODIFIER_VALUE_BULLET_DAMAGE_REDUCTION_PERCENT = 42,
	// MPropertyDescription = "Reduces all damage taken"
	MODIFIER_VALUE_ALL_DAMAGE_TAKEN_REDUCTION = 43,
	// MPropertyDescription = "Scale the crit Multiplier"
	MODIFIER_VALUE_CRIT_DAMAGE_RECEIVED_SCALE = 44,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_HEALTH_MAX = 45,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_MAX_HEALTH_OVERRIDE = 46,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_HEALTH_MAX_PERCENT = 47,
	// MPropertyDescription = "% on Base Health (Hero Base + Level up) not items"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BASE_HEALTH_PERCENT = 48,
	// MPropertyDescription = "Base Health Increase from Level ups"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BASE_HEALTH_FROM_LEVEL = 49,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_MAX_HEALTH_NO_SCALE = 50,
	MODIFIER_VALUE_HEALTH_REGEN_PER_SECOND = 51,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_HEALTH_REGEN_PER_SECOND_PERCENT = 52,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_REGEN_MAX_HEALTH_PERCENT_PER_SECOND = 53,
	// MPropertyDescription = "Health regen applied to us from an external source (ie. not intrinsic health regen)"
	MODIFIER_VALUE_EXTERNAL_HEALTH_REGEN_PER_SECOND = 54,
	// MPropertyDescription = "Regen that cannot be reduced by anti heal sources (IE Fountain)"
	MODIFIER_VALUE_EXTERNAL_REGEN_NO_REDUCTION = 55,
	MODIFIER_VALUE_EXTERNAL_HEALTH_REGEN_LOOP_SOUND_OVERRIDE = 56,
	MODIFIER_VALUE_OUT_OF_COMBAT_HEALTH_REGEN = 57,
	MODIFIER_VALUE_BARRIER_AMP_CAST_PERCENT = 58,
	MODIFIER_VALUE_BARRIER_AMP_RECEIVE_PERCENT = 59,
	MODIFIER_VALUE_HEAL_AMP_CAST_PERCENT = 60,
	MODIFIER_VALUE_HEAL_AMP_RECEIVE_PERCENT = 61,
	MODIFIER_VALUE_HEAL_AMP_REGEN_PERCENT = 62,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_AMMO_CLIP_SIZE = 63,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_AMMO_CLIP_SIZE_PERCENT = 64,
	MODIFIER_VALUE_AMMO_CLIP_SIZE_OVERRIDE = 65,
	MODIFIER_VALUE_RELOAD_SPEED = 66,
	MODIFIER_VALUE_RELOAD_SPEED_CONSTANT = 67,
	// MPropertyDescription = "Limit on how fast you can move (walking/sprinting/whatever)"
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_MOVE_SPEED_LIMIT = 68,
	// MPropertyDescription = "Default walking speed (non-sprint)"
	MODIFIER_VALUE_MOVEMENT_SPEED_MAX = 69,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_MOVEMENT_SPEED_MAX_PERCENT = 70,
	// MPropertyDescription = "Raises the cap that move speed bonuses diminish toward, in units"
	MODIFIER_VALUE_MOVEMENT_SPEED_BONUS_CAP_INCREASE = 71,
	MODIFIER_VALUE_MOVEMENT_SPEED_WHILE_ZOOMED_PENALTY_REDUCTION_PERCENT = 72,
	MODIFIER_VALUE_MOVEMENT_SPEED_WHILE_SHOOTING_PENALTY_REDUCTION_PERCENT = 73,
	// MPropertyDescription = "what abilities should use to slow enemies"
	MODIFIER_VALUE_MOVEMENT_SPEED_SLOW_PERCENT = 74,
	// MPropertyDescription = "Abilities that weaken ground dash distance"
	MODIFIER_VALUE_MOVEMENT_GROUND_DASH_REDUCTION_PERCENT = 75,
	// MPropertyDescription = "Abilities that boost ground dash distance"
	MODIFIER_VALUE_MOVEMENT_GROUND_DASH_INCREASE_PERCENT = 76,
	MODIFIER_VALUE_AIR_MOVE_DISTANCE_INCREASE_PERCENT = 77,
	// MPropertyDescription = "Scale Slide speed (alters friction) to get more distance"
	MODIFIER_VALUE_MOVEMENT_SLIDE_DISTANCE_SCALE = 78,
	// MPropertyDescription = "Scale Slide Turn"
	MODIFIER_VALUE_MOVEMENT_SLIDE_TURN_SCALE = 79,
	// MPropertyDescription = "called when a player initiates a slide. Takes the first string returned as a vfx replacement"
	MODIFIER_VALUE_SLIDE_EFFECT_REPLACEMENT = 80,
	// MPropertyDescription = "Weaken the effect of Slows"
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_MOVEMENT_SLOW_RESISTANCE = 81,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_ATTACK_RANGE = 82,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_ATTACK_RANGE_PERCENT = 83,
	MODIFIER_VALUE_ZOOM_INCREASE_PERCENT = 84,
	MODIFIER_VALUE_ZOOM_POSITION = 85,
	MODIFIER_VALUE_WEAPON_RECOIL_REDUCTION_PERCENT = 86,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_SPRINT_SPEED_BONUS = 87,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_SPRINT_SPEED_MAX_PERCENT = 88,
	// MPropertyDescription = "how long the player has been sprinting"
	MODIFIER_VALUE_SPRINT_DURATION = 89,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_SPRINT_ACCELERATION = 90,
	MODIFIER_VALUE_DISPLAY_SPEED_CURRENT = 91,
	MODIFIER_VALUE_DISPLAY_SPEED_MAX = 92,
	MODIFIER_VALUE_AVOID_SPELL = 93,
	// MPropertyDescription = "the stat version of fire rate adjustment"
	MODIFIER_VALUE_FIRE_RATE = 94,
	// MPropertyDescription = "the stat version of negative fire rate"
	MODIFIER_VALUE_FIRE_RATE_SLOW = 95,
	// MPropertyDescription = "Increase Cycle Time (Decrease FireRate)"
	MODIFIER_VALUE_CYCLE_TIME_PERCENTAGE = 96,
	MODIFIER_VALUE_SPREAD_SCALE = 97,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_CYCLE_TIME = 98,
	MODIFIER_VALUE_AMMO_COST_REDUCTION = 99,
	MODIFIER_VALUE_STATUS_RESISTANCE = 100,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_COOLDOWN_REDUCTION_PERCENTAGE = 101,
	MODIFIER_VALUE_COOLDOWN_MAX_TIME = 102,
	MODIFIER_VALUE_COOLDOWN_BETWEEN_CHARGE_REDUCTION_PERCENTAGE = 103,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_ITEM_COOLDOWN_REDUCTION_PERCENTAGE = 104,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_ULTIMATE_COOLDOWN_REDUCTION_PERCENTAGE = 105,
	MODIFIER_VALUE_BONUS_ABILITY_CHARGES = 106,
	MODIFIER_VALUE_BONUS_ABILITY_DURATION_PERCENTAGE = 107,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_ENABLE_CHARGES = 108,
	MODIFIER_VALUE_MELEEATTACK_SPEED = 109,
	MODIFIER_VALUE_MELEE_TRAVEL_DISTANCE_PERCENTAGE = 110,
	MODIFIER_VALUE_PARRY_COOLDOWN_REDUCTION_FIXED = 111,
	MODIFIER_VALUE_FIREARM_ACCURACY_PERCENTAGE = 112,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_TURN_SIDEMOVE_PERCENTAGE = 113,
	MODIFIER_VALUE_CHARGE_SPEED = 114,
	MODIFIER_VALUE_TELEPORT_COOLDOWN_REDUCTION_PERCENT = 115,
	MODIFIER_VALUE_FALL_SPEED_MAX = 116,
	MODIFIER_VALUE_AIR_SPEED_MAX = 117,
	MODIFIER_VALUE_BULLET_EVASION = 118,
	MODIFIER_VALUE_PARRY_PIERCE = 119,
	MODIFIER_VALUE_BULLET_SHIELD_HEALTH = 120,
	MODIFIER_VALUE_BULLET_SHIELD_HEALTH_MAX = 121,
	MODIFIER_VALUE_BULLET_SHIELD_DAMAGE_PERCENT = 122,
	// MPropertyDescription = "Bonus percent damage my spirit damage deals to barriers/shields"
	MODIFIER_VALUE_TECH_SHIELD_DAMAGE_PERCENT = 123,
	MODIFIER_VALUE_BARRIER_HEALTH = 124,
	MODIFIER_VALUE_BONUS_CRIT_DAMAGE_PERCENT = 125,
	MODIFIER_VALUE_WEAPON_CRIT_CHANCE_PERCENT = 126,
	MODIFIER_VALUE_BONUS_WEAPON_DAMAGE_CLOSE_RANGE_MAX_RANGE = 127,
	MODIFIER_VALUE_BONUS_BULLET_DAMAGE_LONG_RANGE_MIN_RANGE = 128,
	MODIFIER_VALUE_TECH_RANGE_ADDITIVE = 129,
	MODIFIER_VALUE_TECH_RANGE_PERCENT = 130,
	MODIFIER_VALUE_TECH_RANGE_CLAMP = 131,
	MODIFIER_VALUE_TECH_RADIUS_ADDITIVE = 132,
	MODIFIER_VALUE_TECH_RADIUS_PERCENT = 133,
	MODIFIER_VALUE_TURN_ANGLE_PER_SECOND_MAX = 134,
	MODIFIER_VALUE_BONUS_JUMP_VERTICAL_SPEED_PERCENT = 135,
	MODIFIER_VALUE_AIR_JUMPS = 136,
	MODIFIER_VALUE_FREE_AIR_JUMPS = 137,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ZIP_LINE_SPEED_ADDITIVE = 138,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ZIP_LINE_SPEED_PERCENTAGE = 139,
	MODIFIER_VALUE_CLIMB_ROPE_SPEED_PERCENTAGE = 140,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_GROUND_FRICTION_PERCENTAGE = 141,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_GROUND_ACCELERATION_PERCENTAGE = 142,
	MODIFIER_VALUE_INVISIBILITY_LEVEL = 143,
	MODIFIER_VALUE_CLOAK_FACTOR = 144,
	MODIFIER_VALUE_CLOAK_DESAT_FACTOR = 145,
	MODIFIER_VALUE_PARTICLE_TINT_OVERRIDE = 146,
	MODIFIER_VALUE_PARTICLE_DESAT_OVERRIDE = 147,
	MODIFIER_VALUE_DIMENSION_TYPE = 148,
	MODIFIER_VALUE_GAMEPLAY_TIME_SCALE_ADDITIVE = 149,
	MODIFIER_VALUE_GAMEPLAY_TIME_SCALE_PERCENT = 150,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ANIMATION_TIME_SCALE_ADDITIVE = 151,
	MODIFIER_VALUE_ANIMATION_TIME_SCALE_PERCENT = 152,
	// MPropertyDescription = "If this is set higher than 1, we skip frame when animating for the entity"
	MODIFIER_VALUE_ANIMATION_FRAME_SKIP_RATE = 153,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_MOVEMENT_TIME_SCALE_ADDITIVE = 154,
	MODIFIER_VALUE_MOVEMENT_TIME_SCALE_PERCENT = 155,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_PARTICLE_TIME_SCALE_ADDITIVE = 156,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_PARTICLE_TIME_SCALE_PERCENT = 157,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_STAMINA = 158,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_STAMINA_REGEN_PER_SECOND_ADDITIVE = 159,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_STAMINA_REGEN_PER_SECOND_PERCENTAGE = 160,
	MODIFIER_VALUE_WEAPON_POWER = 161,
	MODIFIER_VALUE_ARMOR_POWER = 162,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_TECH_POWER = 163,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_TECH_POWER_PERCENT = 164,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_STOLEN_TECH_POWER = 165,
	MODIFIER_VALUE_WEAPON_POWER_PERCENT = 166,
	// MPropertyDescription = "Change air control by this percentage"
	MODIFIER_VALUE_AIR_CONTROL_PERCENT = 167,
	// MPropertyDescription = "How much more potential air acceleration to add"
	MODIFIER_VALUE_AIR_CONTROL_ACCEL_PERCENT = 168,
	// MPropertyDescription = "Adjust ability-spawned projectile speeds"
	MODIFIER_VALUE_ABILITY_PROJECTILE_SPEED_PERCENT = 169,
	// MPropertyDescription = "Adjust bullet projectile speeds"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BULLET_SPEED_PERCENT = 170,
	MODIFIER_VALUE_BASE_BULLET_SPEED_OVERRIDE = 171,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND = 172,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play for friendlies"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_FRIENDLY = 173,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play for enemies"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_ENEMY = 174,
	// MPropertyDescription = "Whiz Replacement sound"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ = 175,
	// MPropertyDescription = "Whiz Left to right replacement sound"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ_LEFT_TO_RIGHT = 176,
	// MPropertyDescription = "Whiz Right to left replacement"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ_RIGHT_TO_LEFT = 177,
	// MPropertyDescription = "called when a player fires their gun. Takes the first string returned as a tracer replacement"
	MODIFIER_VALUE_TRACER_REPLACEMENT = 178,
	// MPropertyDescription = "called when a tracer for a gun is created on the client.  Return the name of a tracer to have it show up on top of the regular tracer"
	MODIFIER_VALUE_TRACER_ADDITIONAL = 179,
	// MPropertySuppressEnumerator
	// MPropertyDescription = "override owner's camera target with this entity"
	MODIFIER_VALUE_CAMERA_TARGET_OVERRIDE = 180,
	// MPropertySuppressEnumerator
	// MPropertyDescription = "A world-space position to apply to the root bone of the entity"
	MODIFIER_VALUE_VISUAL_ORIGIN_OVERRIDE = 181,
	// MPropertyDescription = "Set a value to override spectating Speed (So we don't have to network the whole ent we're spectating)"
	MODIFIER_VALUE_SPECTATING_SPEED_OVERRIDE = 182,
	MODIFIER_VALUE_WEAPON_DAMAGE_TO_NPC_INCREASE = 183,
	MODIFIER_VALUE_AIR_DRAG = 184,
	MODIFIER_VALUE_FALLING_DRAG = 185,
	// MPropertyDescription = "Ability damage against me heals the attacker"
	MODIFIER_VALUE_TECH_DAMAGE_TAKEN_HEALS_ATTACKER = 186,
	// MPropertyDescription = "Bullet damage against me heals the attacker"
	MODIFIER_VALUE_BULLET_DAMAGE_TAKEN_HEALS_ATTACKER = 187,
	// MPropertyDescription = "Tech damage I deal heals me"
	MODIFIER_VALUE_TECH_LIFESTEAL = 188,
	// MPropertyDescription = "Bullet damage I deal heals me"
	MODIFIER_VALUE_BULLET_LIFESTEAL = 189,
	// MPropertyDescription = "If set, overrides the attacker on all bullets fired"
	MODIFIER_VALUE_OVERRIDE_BULLET_ATTACKER = 190,
	// MPropertyDescription = "Override the sound we play when a melee attack hits an enemy"
	MODIFIER_VALUE_OVERRIDE_MELEE_HIT_SOUND = 191,
	// MPropertyDescription = "Override the sound we play when a melee attack hits nothing"
	MODIFIER_VALUE_OVERRIDE_MELEE_MISS_SOUND = 192,
	MODIFIER_VALUE_IMBUED_BONUS_DAMAGE = 193,
	MODIFIER_VALUE_IMBUED_BONUS_DURATION = 194,
	MODIFIER_VALUE_INTRA_BURST_SHOT_CYCLE_TIME_OVERRIDE = 195,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BURST_SHOT_PERCENT = 196,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BURST_SHOT_CONSTANT = 197,
	MODIFIER_VALUE_SPIN_UP_RATE_OVERRIDE = 198,
	MODIFIER_VALUE_SPIN_UP_DECAY_OVERRIDE = 199,
	MODIFIER_VALUE_SPIN_UP_MAX_CYCLE_TIME_OVERRIDE = 200,
	MODIFIER_VALUE_SPIN_UP_MAX_BURST_FIRE_COOLDOWN_OVERRIDE = 201,
	MODIFIER_VALUE_SPIN_UP_CURRENT_SPIN_RATE_OVERRIDE = 202,
	MODIFIER_VALUE_SPIN_UP_SOUND_OVERRIDE = 203,
	MODIFIER_VALUE_SPIN_DOWN_SOUND_OVERRIDE = 204,
	MODIFIER_VALUE_SPIN_LOOP_SOUND_OVERRIDE = 205,
	MODIFIER_VALUE_BONUS_CHANNEL_TIME_PERCENTAGE = 206,
	MODIFIER_VALUE_ABILITY_RESOURCE_MAX_ADDITIVE = 207,
	MODIFIER_VALUE_ABILITY_RESOURCE_REGEN_PER_SECOND_ADDITIVE = 208,
	MODIFIER_VALUE_ABILITY_RESOURCE_REGEN_PER_SECOND_PERCENTAGE = 209,
	MODIFIER_VALUE_PENDING_INCOMING_DAMAGE = 210,
	MODIFIER_VALUE_PENDING_INCOMING_HEAL = 211,
	MODIFIER_VALUE_CAMERA_WOBBLE_INTENSITY = 212,
	MODIFIER_VALUE_CAMERA_WOBBLE_SPEED = 213,
	MODIFIER_VALUE_RESPAWN_TIME_ADDITIVE = 214,
	MODIFIER_VALUE_RESPAWN_TIME_PERCENTAGE = 215,
	MODIFIER_VALUE_RESPAWN_RAMP_TIME_REDUCTION_PERCENT = 216,
	MODIFIER_VALUE_BOON_COUNT = 217,
	MODIFIER_VALUE_FOOTSTEP_ADDITIONAL = 218,
	MODIFIER_VALUE_FOOTSTEP_OVERRIDE = 219,
	MODIFIER_VALUE_MODEL_SCALE = 220,
	MODIFIER_VALUE_MODEL_CHANGE = 221,
	MODIFIER_VALUE_MODEL_SWAP = 222,
	// MPropertyDescription = "Effectiveness stats are base stats on heroes that give them innate bonus or deficiencies when getting certain stats from the shop"
	MODIFIER_VALUE_HERO_BULLET_LIFESTEAL_EFFECTIVENESS = 223,
	// MPropertyDescription = "Effectiveness stats are base stats on heroes that give them innate bonus or deficiencies when getting certain stats from the shop"
	MODIFIER_VALUE_HERO_SPIRIT_LIFESTEAL_EFFECTIVENESS = 224,
	// MPropertyDescription = "Override Parry FX"
	MODIFIER_VALUE_PARRY_FX_OVERRIDE = 225,
	// MPropertyDescription = "Switch the view to a named entity in the map"
	MODIFIER_VALUE_CAMERA_ENTITY_OVERRIDE = 226,
	MODIFIER_VALUE_CAMERA_LEVEL = 227,
	MODIFIER_VALUE_VISION_RADIUS = 228,
	MODIFIER_VALUE_MINIMAP_POSITION_OVERRIDE = 229,
	MODIFIER_VALUE_MINIMAP_CSS_CLASS = 230,
	MODIFIER_VALUE_HERO_CARD_OVERRIDE = 231,
	// MPropertyDescription = "When specified, self casts will be treated as casts on another target"
	MODIFIER_VALUE_SELFCAST_TARGET_OVERRIDE = 232,
	MODIFIER_VALUE_HERO_ATTACH_PARENT = 233,
	MODIFIER_VALUE_DOORWAY_MINIMAP_RANGE = 234,
	MODIFIER_VALUE_MATERIAL_SWAP = 235,
	MODIFIER_VALUE_MINIMAP_ZOOM = 236,
	MODIFIER_VALUE_PARRY_STUN_TIME_BONUS = 237,
	MODIFIER_VALUE_PARRY_COOLDOWN_REDUCTION_PERCENT = 238,
	MODIFIER_VALUE_AIR_DASH_DISTANCE_INCREASE_PERCENT = 239,
	MODIFIER_VALUE_RATKING_ARMOR_HEALTH = 240,
	MODIFIER_VALUE_RATKING_ARMOR_HEALTH_MAX = 241,
	MODIFIER_VALUE_RATKING_NIBBLE_STACKS = 242,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_MELEE_RANGE = 243,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_JUMP_CHARGE_UP_TIME = 244,
	// MPropertySuppressEnumerator
	MODIFIER_VALUE_COUNT = 245,
	// MPropertySuppressEnumerator
	MODIFIER_VALUE_INVALID = 255,
};
