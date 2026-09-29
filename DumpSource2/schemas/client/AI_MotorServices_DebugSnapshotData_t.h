// MGetKV3ClassDefaults = {
//	"active_motor": "",
//	"desired_speed": 0.000000,
//	"motor_velocity":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"motor_path":
//	[
//	],
//	"ground_entity_debug_name": ""
//}
// MPropertyFriendlyName = "Motor Services"
// MDebugSnapshotDataRenderFn
class AI_MotorServices_DebugSnapshotData_t
{
	CGlobalSymbol active_motor;
	float32 desired_speed;
	Vector motor_velocity;
	CUtlVector< AI_MotorServices_DebugSnapshotData_t::MotorPathWaypoint_t > motor_path;
	CUtlString ground_entity_debug_name;
};
