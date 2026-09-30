class CBotDifficultyDefinition
{
	// MPropertyDescription = "Difficulty Enum"
	ECitadelBotDifficulty difficulty; // = "k_ECitadelBotDifficulty_None"
	// MPropertyDescription = "Bots get free gold over time"
	float32 free_gold_per_minute;
	// MPropertyDescription = "GPM that scales with game time"
	float32 free_gold_per_minute_scaled;
	// MPropertyDescription = "How much time until a takeover bot till spend gold/ap"
	float32 takeover_spend_currency_time; // = 240
	// MPropertyDescription = "Are bots allowed to buy items from anywhere"
	bool allow_purchasing_anywhere;
	// MPropertyDescription = "Higher values encourage bots to engage heroes over troopers when a player is within engagement range. 1.0 means heroes and troopers are equal."
	float32 engage_priority_hero_mult; // = 1
	// MPropertyDescription = "Higher values encourage bots to engage human players when within engagement range.  1.0 means human players and other targets equal"
	float32 engage_priority_human_mult; // = 1
	// MPropertyDescription = "Forces bots to prioritize getting last hits on enemies below this health"
	float32 engage_last_hit_threshold;
	// MPropertyDescription = "Extra distance bots are willing to engage enemies at to get last hits"
	float32 engage_distance_last_hit_mult; // = 1
	// MPropertyDescription = "Extra distance bots are willing to engage heroes at"
	float32 engage_distance_hero_mult; // = 1
	// MPropertyDescription = "Distance bots are willing to engage enemies at"
	float32 engage_distance; // = 1000
	// MPropertyDescription = "Distance bots will engage to the left or right of the target"
	float32 engage_lane_side_dist; // = 200
	// MPropertyDescription = "Distance bots will engage to the left or right of the target"
	float32 engage_player_side_dist; // = 200
	// MPropertyDescription = "Distance behind creep wave midpoint where bots will prefer to be"
	float32 safety_distance_behind_ally_creeps; // = 5
	// MPropertyDescription = "Distance to keep away from enemy bosses. A value of 1.0 is right outside that tower's attack range."
	float32 safety_distance_away_from_tower_range; // = 1
	// MPropertyDescription = "Bots pick on a time interval"
	float32 choose_lane_on_interval; // = 3
	// MPropertyDescription = "Duration Bot prioritizes changing lanes vs fighting"
	float32 lane_change_duration; // = 10
	// MPropertyDescription = "Bots try to balance lanes"
	bool choose_balanced_lanes; // = true
	// MPropertyDescription = "Desired bot miss chance"
	float32 attack_miss_chance;
	// MPropertyDescription = "Bots choose a random angle in this range to offset their perfect aim"
	float32 attack_enemies_inaccuracy;
	// MPropertyDescription = "When trying to miss "
	float32 attack_enemies_inaccuracy_scale; // = 1
	// MPropertyDescription = "Distance (m) to make bots even worse accuracy"
	float32 attack_enemies_inaccuracy_distance; // = 25
	// MPropertyDescription = "Scale the accuracy by this amount at distance"
	float32 attack_enemies_inaccuracy_distance_scale; // = 1.5
	// MPropertyDescription = "Scale inaccuracy by this amount when threatened"
	float32 attack_enemies_inaccuracy_threat_scale; // = 0.5
	// MPropertyDescription = "Bot reloads when clip is this low"
	float32 reload_pct;
	// MPropertyDescription = "Citadel bots will randomly purchase available upgrades every few seconds"
	float32 purchase_random_upgrades;
	// MPropertyDescription = "Citadel bots will purchase available upgrades in order every few seconds"
	float32 purchase_upgrades_in_order;
	// MPropertyDescription = "Time between bot using ability"
	float32 use_ability_cooldown; // = 1
	// MPropertyDescription = "Chance to do a melee attack when within range"
	float32 heavy_melee_chance; // = 0.1
	// MPropertyDescription = "Chance to do a melee attack when within range while reloading"
	float32 heavy_melee_chance_in_reload; // = 0.3
	// MPropertyDescription = "Chance to parry when bot sees a melee attack"
	float32 parry_chance; // = 0.02
	// MPropertyDescription = "Penalty to parrying when bot has no LoS"
	float32 parry_no_los_penalty; // = 0.5
	// MPropertyDescription = "How much parry chance goes up after each recent melee attack"
	float32 parry_chance_escalation;
	// MPropertyDescription = "At what percentage of melee charge does a bot decide to parry, lower values mean the bot will parry earlier"
	float32 parry_melee_charge_detection_pct; // = 10
	// MPropertyDescription = "How long to remember recent attackers"
	float32 max_attacker_memory; // = 6
	// MPropertyDescription = "How long to remember recent melee attacks"
	float32 max_melee_attack_memory; // = 20
	// MPropertyDescription = "Forces bots to attack nearby enemies"
	bool jump_sometimes; // = true
	// MPropertyDescription = "Forces bots to attack nearby enemies"
	bool roll_after_damage; // = true
	// MPropertyDescription = "How often bots will roll given damage conditions"
	float32 roll_chance; // = 0.4
	// MPropertyDescription = "Roll chance amplification when low health"
	float32 roll_chance_lowhealth_scale; // = 1.6
	// MPropertyDescription = "Time between roll attempts"
	float32 roll_frequency; // = 2
	// MPropertyDescription = "Fight the midboss"
	bool fight_midboss;
	// MPropertyDescription = "Fight for the idol"
	bool fight_for_idol;
	// MPropertyDescription = "How many ticks between the bot performing sensing"
	int32 sensing_tick_interval; // = 12
	// MPropertyDescription = "Seconds after a bot sees you before it can react"
	float32 visual_reaction_time; // = 0.75
	// MPropertyDescription = "Seconds after a bot sees you before it can react"
	float32 shoot_duration; // = 0.75
	// MPropertyDescription = "Factor from Projectile speed to usable range"
	float32 projectile_range_scale; // = 0.5
	// MPropertyDescription = "Default Cast Range for abilities that don't specify"
	float32 ability_min_cast_range; // = 800
	// MPropertyDescription = "Default Enemy range to use friendly abilities"
	float32 ability_min_cast_range_friendly; // = 800
	// MPropertyDescription = "Maximum life for friendly ability to be used (prevents healing when full health)"
	float32 ability_friendly_life_threshold; // = 70
	// MPropertyDescription = "Pitch (aiming down) for bots when using a friendly ability"
	float32 ability_friendly_pitch; // = 60
	// MPropertyDescription = "How much in range before doing an ability (ie not casting on edges)"
	float32 ability_window_size; // = 0.85
	// MPropertyDescription = "Interval in seconds at which to spend AP randomly"
	float32 spend_random_ap;
	// MPropertyDescription = "Bonus regen all the time"
	float32 bonus_regen;
	// MPropertyDescription = "Regen when not seen by enemy players"
	float32 bonus_regen_outofsight; // = 0.03
	// MPropertyDescription = "Bonus run speed"
	float32 bonus_run_speed; // = 6
	// MPropertyDescription = "Radius for bots to look for better locations to path to"
	float32 safe_spot_target_radius; // = 6
	// MPropertyDescription = "Radius for bots to consider whether a position is safe"
	float32 safe_spot_safety_radius; // = 7
	// MPropertyDescription = "Distance away from target to search for an attack location"
	float32 enemy_hero_engage_distance; // = 10
	// MPropertyDescription = "Minimum number of spots to sample looking for good positioning"
	int32 safe_spot_samples_min; // = 1
	// MPropertyDescription = "Maximum number of spots to sample looking for good positioning"
	int32 safe_spot_samples_max; // = 3
	// MPropertyDescription = "Try to deny orbs"
	int32 attempt_orb_start_time; // = 180
	// MPropertyDescription = "Percentage of the time to look for red orbs to shoot"
	int32 attempt_deny_orb_pct; // = 10
	// MPropertyDescription = "Percentage of the time to look for gold orbs to shoot"
	int32 attempt_secure_orb_pct; // = 5
	// MPropertyDescription = "Range(m) to Scan for Orbs"
	float32 attempt_orb_range; // = 35
	// MPropertyDescription = "Low Health"
	float32 low_health; // = 20
	// MPropertyDescription = "When pushed against tower"
	float32 low_health_pushed; // = 15
	// MPropertyDescription = "Guide bot talks about neutrals"
	bool guide_bot_neutral_info;
	// MPropertyDescription = "Min time between messages a player bot can send"
	float32 message_interval; // = 20
	// MPropertyDescription = "How many frames between LOS check refreshes on the Bots?"
	int32 los_check_interval; // = 15
};
