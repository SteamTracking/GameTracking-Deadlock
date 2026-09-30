class CitadelCameraOperationsSequence_t
{
	// MPropertySuppressField
	CUtlStringToken m_strToken;
	// MPropertySuppressField
	bool m_bIsEmpty;
	// MPropertyDescription = "Priority is the first test when seeing which camera context is currently being used. Higher priorty wins."
	int32 m_nPriority; // = 1
	CUtlVector< CitadelCameraDistanceOperationDef_t > m_vecDistanceOperations;
	CUtlVector< CitadelCameraFOVOperationDef_t > m_vecFOVOperations;
	CUtlVector< CitadelCameraTargetPosOperationDef_t > m_vecTargetPosOperations;
	CUtlVector< CitadelCameraVertOffsetOperationDef_t > m_vecVertOffsetOperations;
	CUtlVector< CitadelCameraHorizOffsetOperationDef_t > m_vecHorizOffsetOperations;
};
