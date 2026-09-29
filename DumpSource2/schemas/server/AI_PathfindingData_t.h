// MGetKV3ClassDefaults = {
//	"m_pathFindingAlgorithm": "eStandard",
//	"m_dataWaypoints":
//	{
//		"m_vPrevWaypointPos": null,
//		"m_pFirstWaypoint": null
//	},
//	"m_dataRadialGoal":
//	{
//		"m_Center":
//		{
//			"m_Type": "WORLD_SPACE_POSITION",
//			"m_vRelativeOffset":
//			[
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000
//			],
//			"m_vWorldSpacePos": null,
//			"m_hEntity": null,
//			"m_nLastKnownNavAreaVersion": 0,
//			"m_nNavAreaID": 4294967295,
//			"m_nNavBlockID": 4294967295
//		},
//		"m_flRadius": 0.000000,
//		"m_flRelArc": 0.000000,
//		"m_flMinAllowedRadius": 0.000000,
//		"m_nFlags": "",
//		"m_vUp":
//		[
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000
//		]
//	},
//	"m_dataDirectionalGoal":
//	{
//		"m_flMinPathLength": 0.000000,
//		"m_vDir":
//		[
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000
//		],
//		"m_flMaxPathLength": -1.000000
//	},
//	"m_dataRandomGoal":
//	{
//		"m_Pos":
//		{
//			"m_Type": "WORLD_SPACE_POSITION",
//			"m_vRelativeOffset":
//			[
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000
//			],
//			"m_vWorldSpacePos": null,
//			"m_hEntity": null,
//			"m_nLastKnownNavAreaVersion": 0,
//			"m_nNavAreaID": 4294967295,
//			"m_nNavBlockID": 4294967295
//		},
//		"m_flMinPathLength": 0.000000,
//		"m_flMaxPathLength": 0.000000
//	},
//	"m_dataWanderGoal":
//	{
//		"m_OptionalCenter":
//		{
//			"m_Type": "WORLD_SPACE_POSITION",
//			"m_vRelativeOffset":
//			[
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000
//			],
//			"m_vWorldSpacePos": null,
//			"m_hEntity": null,
//			"m_nLastKnownNavAreaVersion": 0,
//			"m_nNavAreaID": 4294967295,
//			"m_nNavBlockID": 4294967295
//		},
//		"m_flMinRadius": 0.000000,
//		"m_flMaxRadius": 0.000000
//	},
//	"m_dataVectorGoal":
//	{
//		"m_OptionalStartPoint":
//		{
//			"m_Type": "WORLD_SPACE_POSITION",
//			"m_vRelativeOffset":
//			[
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000,
//				340282346638528859811704183484516925440.000000
//			],
//			"m_vWorldSpacePos": null,
//			"m_hEntity": null,
//			"m_nLastKnownNavAreaVersion": 0,
//			"m_nNavAreaID": 4294967295,
//			"m_nNavBlockID": 4294967295
//		},
//		"m_vDir":
//		[
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000
//		],
//		"m_flTargetDist": 0.000000,
//		"m_flMinDist": 0.000000,
//		"m_bShouldDeflect": false
//	},
//	"m_dataMultiGoal":
//	{
//		"m_vecPoints":
//		[
//		]
//	},
//	"m_dataStopGoal":
//	{
//		"m_eMode": "eSmooth",
//		"m_eFacing": "ePathForward"
//	}
//}
class AI_PathfindingData_t
{
	NavGoalPathfindingAlgorithm_t m_pathFindingAlgorithm;
	AI_PathfindingData_Waypoints_t m_dataWaypoints;
	AI_PathfindingData_RadialGoal_t m_dataRadialGoal;
	AI_PathfindingData_DirectionalGoal_t m_dataDirectionalGoal;
	AI_PathfindingData_RandomGoal_t m_dataRandomGoal;
	AI_PathfindingData_WanderGoal_t m_dataWanderGoal;
	AI_PathfindingData_VectorGoal_t m_dataVectorGoal;
	AI_PathfindingData_MultiGoal_t m_dataMultiGoal;
	AI_PathfindingData_StopGoal_t m_dataStopGoal;
};
