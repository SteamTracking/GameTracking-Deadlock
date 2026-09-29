class CFuncTrackChange : public CFuncPlatRot
{
	// MSaveBehavior = 1
	CHandle< CPathTrack > m_trackTop;
	// MSaveBehavior = 1
	CHandle< CPathTrack > m_trackBottom;
	// MSaveBehavior = 1
	CHandle< CFuncTrackTrain > m_train;
	// MSaveBehavior = 1
	CUtlSymbolLarge m_trackTopName;
	// MSaveBehavior = 1
	CUtlSymbolLarge m_trackBottomName;
	// MSaveBehavior = 1
	CUtlSymbolLarge m_trainName;
	TRAIN_CODE m_code;
	int32 m_targetState;
	int32 m_use;
};
