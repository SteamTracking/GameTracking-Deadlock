// MGetKV3ClassDefaults = {
//	"s_movement_id": "",
//	"s_movement_serial_number": 0,
//	"s_goal_source_location": "",
//	"last_waypoint_pos": null,
//	"goal_location": null,
//	"waypoints":
//	[
//	],
//	"s_arrival_movement_gait_set": ""
//}
// MPropertyFriendlyName = "Navigator"
// MDebugSnapshotDataRenderFn
class AI_Navigator_DebugSnapshotData_t
{
	CGlobalSymbol s_movement_id;
	uint32 s_movement_serial_number;
	CUtlString s_goal_source_location;
	VectorWS last_waypoint_pos;
	VectorWS goal_location;
	CUtlVector< AI_Navigator_DebugSnapshotData_t::Waypoint_t > waypoints;
	CGlobalSymbol s_arrival_movement_gait_set;
};
