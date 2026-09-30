class CPulseCell_Outflow_PlaySceneBase::CursorState_t
{
	CHandle< CBaseEntity > m_sceneInstance;
	CHandle< CBaseEntity > m_mainActor;
	CUtlHashtable< PulseCursorID_t, int32 > m_cursorIDToRequirementsEventID;
	CUtlHashtable< PulseSymbol_t, PulseCursorID_t > m_outflowNameToCursorID;
};
