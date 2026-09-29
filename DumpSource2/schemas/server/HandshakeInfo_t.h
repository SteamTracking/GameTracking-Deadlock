// MGetKV3ClassDefaults = null
class HandshakeInfo_t
{
	CGlobalSymbol m_sHandshakeName;
	// MNotSaved
	uint64 m_nActiveEventUniqueID;
	GameTick_t m_nLastHandshakeUpdateTick;
	HandshakeState_t m_nHandshakeState;
	HandshakeTagState_t m_nAG2EmulatedState;
	TaskHandshakeScope_t m_nHandshakeScope;
	bool m_bForceHandshakeRestartOnScriptedSequenceCompletion;
	BodySectionMutex_t m_eBodySectionMutex;
	BodySectionMutex_t m_ePreviousBodySectionMutex;
	HandshakeRestartType_t m_eRestartType;
};
