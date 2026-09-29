// MGetKV3ClassDefaults = {
//	"strEntityName": "",
//	"nHintType": 0,
//	"strGroup": "",
//	"iDisabled": 0,
//	"iszGenericType": "",
//	"fIgnoreFacing": "HIF_DEFAULT",
//	"minState": "NPC_STATE_IDLE",
//	"maxState": "NPC_STATE_COMBAT",
//	"nRadius": 0,
//	"ePriority": "HINT_PRIORITY_LOW",
//	"bReturnHintPositionAsOnGroundPerHull": false
//}
class HintNodeData
{
	CUtlSymbolLarge strEntityName;
	int16 nHintType;
	CUtlSymbolLarge strGroup;
	int32 iDisabled;
	CUtlSymbolLarge iszGenericType;
	HintIgnoreFacing_t fIgnoreFacing;
	NPC_STATE minState;
	NPC_STATE maxState;
	int32 nRadius;
	HintPriority_t ePriority;
	bool bReturnHintPositionAsOnGroundPerHull;
};
