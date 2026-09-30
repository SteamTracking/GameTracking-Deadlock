class HintNodeData
{
	CUtlSymbolLarge strEntityName;
	int16 nHintType;
	CUtlSymbolLarge strGroup;
	int32 iDisabled;
	CUtlSymbolLarge iszGenericType;
	HintIgnoreFacing_t fIgnoreFacing; // = "HIF_DEFAULT"
	NPC_STATE minState; // = "NPC_STATE_IDLE"
	NPC_STATE maxState; // = "NPC_STATE_COMBAT"
	int32 nRadius;
	HintPriority_t ePriority; // = "HINT_PRIORITY_LOW"
	bool bReturnHintPositionAsOnGroundPerHull;
};
