// MGetKV3ClassDefaults = {
//	"_class": "AI_DefaultNPC_DebugSnapshotData_t",
//	"s_npc_current_ability": "",
//	"s_npc_current_held_ability": "",
//	"s_npc_tactic_current": "",
//	"s_npc_tactic_phase": "",
//	"tactic_interrupt_conditions":
//	[
//	],
//	"path_query":
//	{
//		"m_nInitialMovementId": "",
//		"m_nCurrentMovementId": "",
//		"m_nMode": "",
//		"m_nType": "",
//		"m_nState": ""
//	},
//	"path_queries_speculative":
//	[
//	]
//}
// MPropertyFriendlyName = "Default NPC"
// MHasKV3TransferPolymorphicClassname
class AI_DefaultNPC_DebugSnapshotData_t : public DebugSnapshotBaseStructuredData_t
{
	CGlobalSymbol s_npc_current_ability;
	CGlobalSymbol s_npc_current_held_ability;
	CGlobalSymbol s_npc_tactic_current;
	CGlobalSymbol s_npc_tactic_phase;
	CUtlVector< CGlobalSymbol > tactic_interrupt_conditions;
	AI_DefaultNPC_DebugSnapshotData_t::PathQuery_t path_query;
	CUtlVector< AI_DefaultNPC_DebugSnapshotData_t::PathQuery_t > path_queries_speculative;
};
