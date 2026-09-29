class CVNodeTypeDesc
{
	CUtlString m_name;
	CUtlString m_iconName;
	CUtlString m_prefix;
	CUtlVector< CUtlString > m_inputNames;
	CUtlVector< CUtlString > m_outputNames;
	CUtlVector< int32 > m_inputTypeIds;
	CUtlVector< int32 > m_outputTypeIds;
	bool m_bIsGroup;
	bool m_bAppliesToMainGraph;
	bool m_bAppliesToVoiceGraph;
	bool m_bIsAudioTrack;
	bool m_bIsAudioOutput;
	bool m_bIsControlInput;
	bool m_bIsControlOutput;
	bool m_bIsSubgraphNode;
};
