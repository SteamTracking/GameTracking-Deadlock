enum EModifierValue : uint16_t
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
	// MPropertyDescription = "Flat bonus to the max move speed while crouched on the ground"
	MODIFIER_VALUE_CROUCH_SPEED_BONUS = 89,
	// MPropertyDescription = "how long the player has been sprinting"
	MODIFIER_VALUE_SPRINT_DURATION = 90,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_SPRINT_ACCELERATION = 91,
	MODIFIER_VALUE_DISPLAY_SPEED_CURRENT = 92,
	MODIFIER_VALUE_DISPLAY_SPEED_MAX = 93,
	MODIFIER_VALUE_AVOID_SPELL = 94,
	// MPropertyDescription = "the stat version of fire rate adjustment"
	MODIFIER_VALUE_FIRE_RATE = 95,
	// MPropertyDescription = "the stat version of negative fire rate"
	MODIFIER_VALUE_FIRE_RATE_SLOW = 96,
	// MPropertyDescription = "Increase Cycle Time (Decrease FireRate)"
	MODIFIER_VALUE_CYCLE_TIME_PERCENTAGE = 97,
	MODIFIER_VALUE_SPREAD_SCALE = 98,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_CYCLE_TIME = 99,
	MODIFIER_VALUE_AMMO_COST_REDUCTION = 100,
	MODIFIER_VALUE_STATUS_RESISTANCE = 101,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_COOLDOWN_REDUCTION_PERCENTAGE = 102,
	MODIFIER_VALUE_COOLDOWN_MAX_TIME = 103,
	MODIFIER_VALUE_COOLDOWN_BETWEEN_CHARGE_REDUCTION_PERCENTAGE = 104,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_ITEM_COOLDOWN_REDUCTION_PERCENTAGE = 105,
	// MModifierValueCacheEnabled
	MODIFIER_VALUE_ULTIMATE_COOLDOWN_REDUCTION_PERCENTAGE = 106,
	MODIFIER_VALUE_BONUS_ABILITY_CHARGES = 107,
	MODIFIER_VALUE_BONUS_ABILITY_DURATION_PERCENTAGE = 108,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_ENABLE_CHARGES = 109,
	MODIFIER_VALUE_MELEEATTACK_SPEED = 110,
	MODIFIER_VALUE_MELEE_TRAVEL_DISTANCE_PERCENTAGE = 111,
	MODIFIER_VALUE_PARRY_COOLDOWN_REDUCTION_FIXED = 112,
	MODIFIER_VALUE_FIREARM_ACCURACY_PERCENTAGE = 113,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_TURN_SIDEMOVE_PERCENTAGE = 114,
	MODIFIER_VALUE_CHARGE_SPEED = 115,
	MODIFIER_VALUE_TELEPORT_COOLDOWN_REDUCTION_PERCENT = 116,
	MODIFIER_VALUE_FALL_SPEED_MAX = 117,
	MODIFIER_VALUE_AIR_SPEED_MAX = 118,
	MODIFIER_VALUE_BULLET_EVASION = 119,
	MODIFIER_VALUE_PARRY_PIERCE = 120,
	MODIFIER_VALUE_BULLET_SHIELD_HEALTH = 121,
	MODIFIER_VALUE_BULLET_SHIELD_HEALTH_MAX = 122,
	MODIFIER_VALUE_BULLET_SHIELD_DAMAGE_PERCENT = 123,
	// MPropertyDescription = "Bonus percent damage my spirit damage deals to barriers/shields"
	MODIFIER_VALUE_TECH_SHIELD_DAMAGE_PERCENT = 124,
	MODIFIER_VALUE_BARRIER_HEALTH = 125,
	MODIFIER_VALUE_BONUS_CRIT_DAMAGE_PERCENT = 126,
	MODIFIER_VALUE_WEAPON_CRIT_CHANCE_PERCENT = 127,
	MODIFIER_VALUE_BONUS_WEAPON_DAMAGE_CLOSE_RANGE_MAX_RANGE = 128,
	MODIFIER_VALUE_BONUS_BULLET_DAMAGE_LONG_RANGE_MIN_RANGE = 129,
	MODIFIER_VALUE_TECH_RANGE_ADDITIVE = 130,
	MODIFIER_VALUE_TECH_RANGE_PERCENT = 131,
	MODIFIER_VALUE_TECH_RANGE_CLAMP = 132,
	MODIFIER_VALUE_TECH_RADIUS_ADDITIVE = 133,
	MODIFIER_VALUE_TECH_RADIUS_PERCENT = 134,
	MODIFIER_VALUE_TURN_ANGLE_PER_SECOND_MAX = 135,
	MODIFIER_VALUE_BONUS_JUMP_VERTICAL_SPEED_PERCENT = 136,
	MODIFIER_VALUE_AIR_JUMPS = 137,
	MODIFIER_VALUE_FREE_AIR_JUMPS = 138,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ZIP_LINE_SPEED_ADDITIVE = 139,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ZIP_LINE_SPEED_PERCENTAGE = 140,
	MODIFIER_VALUE_CLIMB_ROPE_SPEED_PERCENTAGE = 141,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_GROUND_FRICTION_PERCENTAGE = 142,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_GROUND_ACCELERATION_PERCENTAGE = 143,
	MODIFIER_VALUE_INVISIBILITY_LEVEL = 144,
	MODIFIER_VALUE_CLOAK_FACTOR = 145,
	MODIFIER_VALUE_CLOAK_DESAT_FACTOR = 146,
	MODIFIER_VALUE_PARTICLE_TINT_OVERRIDE = 147,
	MODIFIER_VALUE_PARTICLE_DESAT_OVERRIDE = 148,
	MODIFIER_VALUE_DIMENSION_TYPE = 149,
	MODIFIER_VALUE_GAMEPLAY_TIME_SCALE_ADDITIVE = 150,
	MODIFIER_VALUE_GAMEPLAY_TIME_SCALE_PERCENT = 151,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_ANIMATION_TIME_SCALE_ADDITIVE = 152,
	MODIFIER_VALUE_ANIMATION_TIME_SCALE_PERCENT = 153,
	// MPropertyDescription = "If this is set higher than 1, we skip frame when animating for the entity"
	MODIFIER_VALUE_ANIMATION_FRAME_SKIP_RATE = 154,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_MOVEMENT_TIME_SCALE_ADDITIVE = 155,
	MODIFIER_VALUE_MOVEMENT_TIME_SCALE_PERCENT = 156,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_PARTICLE_TIME_SCALE_ADDITIVE = 157,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_PARTICLE_TIME_SCALE_PERCENT = 158,
	// MModifierValueCacheEnabled_InvalidateOnTick_IgnoreParams
	MODIFIER_VALUE_STAMINA = 159,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_STAMINA_REGEN_PER_SECOND_ADDITIVE = 160,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_STAMINA_REGEN_PER_SECOND_PERCENTAGE = 161,
	MODIFIER_VALUE_WEAPON_POWER = 162,
	MODIFIER_VALUE_ARMOR_POWER = 163,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_TECH_POWER = 164,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_TECH_POWER_PERCENT = 165,
	// MModifierValueCacheEnabled_InvalidateOnTick
	MODIFIER_VALUE_STOLEN_TECH_POWER = 166,
	MODIFIER_VALUE_WEAPON_POWER_PERCENT = 167,
	// MPropertyDescription = "Change air control by this percentage"
	MODIFIER_VALUE_AIR_CONTROL_PERCENT = 168,
	// MPropertyDescription = "How much more potential air acceleration to add"
	MODIFIER_VALUE_AIR_CONTROL_ACCEL_PERCENT = 169,
	// MPropertyDescription = "Adjust ability-spawned projectile speeds"
	MODIFIER_VALUE_ABILITY_PROJECTILE_SPEED_PERCENT = 170,
	// MPropertyDescription = "Adjust bullet projectile speeds"
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BULLET_SPEED_PERCENT = 171,
	MODIFIER_VALUE_BASE_BULLET_SPEED_OVERRIDE = 172,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND = 173,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play for friendlies"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_FRIENDLY = 174,
	// MPropertyDescription = "called when a bullet is shot.  Return the name of a sound to play for enemies"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_ENEMY = 175,
	// MPropertyDescription = "Whiz Replacement sound"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ = 176,
	// MPropertyDescription = "Whiz Left to right replacement sound"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ_LEFT_TO_RIGHT = 177,
	// MPropertyDescription = "Whiz Right to left replacement"
	MODIFIER_VALUE_BULLET_SHOOT_SOUND_WHIZ_RIGHT_TO_LEFT = 178,
	// MPropertyDescription = "called when a player fires their gun. Takes the first string returned as a tracer replacement"
	MODIFIER_VALUE_TRACER_REPLACEMENT = 179,
	// MPropertyDescription = "called when a tracer for a gun is created on the client.  Return the name of a tracer to have it show up on top of the regular tracer"
	MODIFIER_VALUE_TRACER_ADDITIONAL = 180,
	// MPropertySuppressEnumerator
	// MPropertyDescription = "override owner's camera target with this entity"
	MODIFIER_VALUE_CAMERA_TARGET_OVERRIDE = 181,
	// MPropertySuppressEnumerator
	// MPropertyDescription = "A world-space position to apply to the root bone of the entity"
	MODIFIER_VALUE_VISUAL_ORIGIN_OVERRIDE = 182,
	// MPropertyDescription = "Set a value to override spectating Speed (So we don't have to network the whole ent we're spectating)"
	MODIFIER_VALUE_SPECTATING_SPEED_OVERRIDE = 183,
	MODIFIER_VALUE_WEAPON_DAMAGE_TO_NPC_INCREASE = 184,
	MODIFIER_VALUE_AIR_DRAG = 185,
	MODIFIER_VALUE_FALLING_DRAG = 186,
	// MPropertyDescription = "Ability damage against me heals the attacker"
	MODIFIER_VALUE_TECH_DAMAGE_TAKEN_HEALS_ATTACKER = 187,
	// MPropertyDescription = "Bullet damage against me heals the attacker"
	MODIFIER_VALUE_BULLET_DAMAGE_TAKEN_HEALS_ATTACKER = 188,
	// MPropertyDescription = "Tech damage I deal heals me"
	MODIFIER_VALUE_TECH_LIFESTEAL = 189,
	// MPropertyDescription = "Bullet damage I deal heals me"
	MODIFIER_VALUE_BULLET_LIFESTEAL = 190,
	// MPropertyDescription = "If set, overrides the attacker on all bullets fired"
	MODIFIER_VALUE_OVERRIDE_BULLET_ATTACKER = 191,
	// MPropertyDescription = "Override the sound we play when a melee attack hits an enemy"
	MODIFIER_VALUE_OVERRIDE_MELEE_HIT_SOUND = 192,
	// MPropertyDescription = "Override the sound we play when a melee attack hits nothing"
	MODIFIER_VALUE_OVERRIDE_MELEE_MISS_SOUND = 193,
	MODIFIER_VALUE_IMBUED_BONUS_DAMAGE = 194,
	MODIFIER_VALUE_IMBUED_BONUS_DURATION = 195,
	MODIFIER_VALUE_INTRA_BURST_SHOT_CYCLE_TIME_OVERRIDE = 196,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BURST_SHOT_PERCENT = 197,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_BURST_SHOT_CONSTANT = 198,
	MODIFIER_VALUE_SPIN_UP_RATE_OVERRIDE = 199,
	MODIFIER_VALUE_SPIN_UP_DECAY_OVERRIDE = 200,
	MODIFIER_VALUE_SPIN_UP_MAX_CYCLE_TIME_OVERRIDE = 201,
	MODIFIER_VALUE_SPIN_UP_MAX_BURST_FIRE_COOLDOWN_OVERRIDE = 202,
	MODIFIER_VALUE_SPIN_UP_CURRENT_SPIN_RATE_OVERRIDE = 203,
	MODIFIER_VALUE_SPIN_UP_SOUND_OVERRIDE = 204,
	MODIFIER_VALUE_SPIN_DOWN_SOUND_OVERRIDE = 205,
	MODIFIER_VALUE_SPIN_LOOP_SOUND_OVERRIDE = 206,
	MODIFIER_VALUE_BONUS_CHANNEL_TIME_PERCENTAGE = 207,
	MODIFIER_VALUE_ABILITY_RESOURCE_MAX_ADDITIVE = 208,
	MODIFIER_VALUE_ABILITY_RESOURCE_REGEN_PER_SECOND_ADDITIVE = 209,
	MODIFIER_VALUE_ABILITY_RESOURCE_REGEN_PER_SECOND_PERCENTAGE = 210,
	MODIFIER_VALUE_PENDING_INCOMING_DAMAGE = 211,
	MODIFIER_VALUE_PENDING_INCOMING_HEAL = 212,
	MODIFIER_VALUE_CAMERA_WOBBLE_INTENSITY = 213,
	MODIFIER_VALUE_CAMERA_WOBBLE_SPEED = 214,
	MODIFIER_VALUE_RESPAWN_TIME_ADDITIVE = 215,
	MODIFIER_VALUE_RESPAWN_TIME_PERCENTAGE = 216,
	MODIFIER_VALUE_RESPAWN_RAMP_TIME_REDUCTION_PERCENT = 217,
	MODIFIER_VALUE_BOON_COUNT = 218,
	MODIFIER_VALUE_FOOTSTEP_ADDITIONAL = 219,
	MODIFIER_VALUE_FOOTSTEP_OVERRIDE = 220,
	MODIFIER_VALUE_MODEL_SCALE = 221,
	MODIFIER_VALUE_MODEL_CHANGE = 222,
	MODIFIER_VALUE_MODEL_SWAP = 223,
	// MPropertyDescription = "Effectiveness stats are base stats on heroes that give them innate bonus or deficiencies when getting certain stats from the shop"
	MODIFIER_VALUE_HERO_BULLET_LIFESTEAL_EFFECTIVENESS = 224,
	// MPropertyDescription = "Effectiveness stats are base stats on heroes that give them innate bonus or deficiencies when getting certain stats from the shop"
	MODIFIER_VALUE_HERO_SPIRIT_LIFESTEAL_EFFECTIVENESS = 225,
	// MPropertyDescription = "Override Parry FX"
	MODIFIER_VALUE_PARRY_FX_OVERRIDE = 226,
	// MPropertyDescription = "Switch the view to a named entity in the map"
	MODIFIER_VALUE_CAMERA_ENTITY_OVERRIDE = 227,
	MODIFIER_VALUE_CAMERA_LEVEL = 228,
	MODIFIER_VALUE_VISION_RADIUS = 229,
	MODIFIER_VALUE_MINIMAP_POSITION_OVERRIDE = 230,
	MODIFIER_VALUE_MINIMAP_CSS_CLASS = 231,
	MODIFIER_VALUE_HERO_CARD_OVERRIDE = 232,
	// MPropertyDescription = "When specified, self casts will be treated as casts on another target"
	MODIFIER_VALUE_SELFCAST_TARGET_OVERRIDE = 233,
	MODIFIER_VALUE_HERO_ATTACH_PARENT = 234,
	MODIFIER_VALUE_DOORWAY_MINIMAP_RANGE = 235,
	MODIFIER_VALUE_MATERIAL_SWAP = 236,
	MODIFIER_VALUE_MINIMAP_ZOOM = 237,
	MODIFIER_VALUE_PARRY_STUN_TIME_BONUS = 238,
	MODIFIER_VALUE_PARRY_COOLDOWN_REDUCTION_PERCENT = 239,
	MODIFIER_VALUE_AIR_DASH_DISTANCE_INCREASE_PERCENT = 240,
	MODIFIER_VALUE_RATKING_ARMOR_HEALTH = 241,
	MODIFIER_VALUE_RATKING_ARMOR_HEALTH_MAX = 242,
	MODIFIER_VALUE_RATKING_NIBBLE_STACKS = 243,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_BONUS_MELEE_RANGE = 244,
	// MModifierValueCacheEnabled_IgnoreParams
	MODIFIER_VALUE_JUMP_CHARGE_UP_TIME = 245,
	// MPropertySuppressEnumerator
	MODIFIER_VALUE_COUNT = 246,
	// MPropertySuppressEnumerator
	MODIFIER_VALUE_INVALID = 65535,
};
