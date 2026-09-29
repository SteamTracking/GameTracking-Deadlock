// MGetKV3ClassDefaults = {
//	"_class": "AI_BaseNPC_DebugSnapshotData_t",
//	"npc_state": "",
//	"current_enemy": null,
//	"s_current_schedule": "",
//	"s_current_task": "",
//	"s_prev_schedule": "",
//	"s_npc_current_movement": "",
//	"s_last_task_end_location": "",
//	"conditions":
//	[
//	],
//	"anim_events":
//	[
//	],
//	"animgraph":
//	{
//		"ag2_update_id": -1,
//		"e_action_desired": "",
//		"e_action_handshake_restart": "",
//		"e_action_handshake_body_authority_current": "",
//		"e_action_handshake_body_authority_desired": "",
//		"e_movement_type_desired": "",
//		"e_movement_handshake_restart": "",
//		"e_movement_handshake_body_authority_current": "",
//		"e_movement_handshake_body_authority_desired": ""
//	},
//	"navigator":
//	{
//		"s_movement_id": "",
//		"s_movement_serial_number": 0,
//		"s_goal_source_location": "",
//		"last_waypoint_pos": null,
//		"goal_location": null,
//		"waypoints":
//		[
//		],
//		"s_arrival_movement_gait_set": ""
//	},
//	"motorServices":
//	{
//		"active_motor": "",
//		"desired_speed": 0.000000,
//		"motor_velocity":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"motor_path":
//		[
//		],
//		"ground_entity_debug_name": ""
//	},
//	"facingServices":
//	{
//		"npc_position": null,
//		"facing_target_source": "",
//		"facing_target": null,
//		"schedule_facing_priority": "",
//		"strafing_source": "",
//		"strafing_enabled": false
//	}
//}
// MPropertyFriendlyName = "Base NPC"
// MHasKV3TransferPolymorphicClassname
class AI_BaseNPC_DebugSnapshotData_t : public DebugSnapshotBaseStructuredData_t
{
	CGlobalSymbol npc_state;
	CHandle< C_BaseEntity > current_enemy;
	CUtlString s_current_schedule;
	CGlobalSymbol s_current_task;
	CUtlString s_prev_schedule;
	CUtlString s_npc_current_movement;
	CUtlString s_last_task_end_location;
	CUtlVector< CGlobalSymbol > conditions;
	CUtlVector< CGlobalSymbol > anim_events;
	AI_BaseNPCAnimGraph_DebugSnapshotData_t animgraph;
	AI_Navigator_DebugSnapshotData_t navigator;
	AI_MotorServices_DebugSnapshotData_t motorServices;
	AI_FacingServices_DebugSnapshotData_t facingServices;
};
