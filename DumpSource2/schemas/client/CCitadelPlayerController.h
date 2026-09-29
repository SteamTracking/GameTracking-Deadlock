class CCitadelPlayerController : public CBasePlayerController
{
	// MNotSaved
	EPlayerPlayState m_ePlayState;
	int32 m_iGuidedBotMatchLastHits;
	int32 m_iGuidedBotMatchOrbsSecured;
	int32 m_iGuidedBotMatchOrbsDenied;
	int32 m_iGuidedBotMatchDamageToGuardians;
	int32 m_iGuidedBotMatchDamageToPlayers;
	int32 m_iGuidedBotMatchDamageTaken;
	int32 m_iGuidedBotMatchNetWorth;
	int32 m_iGuidedBotMatchModsPurchased;
	int32 m_iGuidedBotMatchAbilityUpgrades;
	float32 m_flGuideBotMatchLastTaskNagVO;
	float32 m_flGuideBotLastTimeTaskCompleted;
	EGuidedBotMatchObjective m_eGuidedBotMatchObjective;
	int32 m_nCurrentRank;
	int8 m_nAssignedLane;
	int8 m_nOriginalLaneAssignment;
	bool m_bBotDisconnectTakeover;
	bool m_bInTeamChat;
	bool m_bInPartyChat;
	bool m_bLaneSwapLocked;
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecLaneSwapRequests;
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecLaneSwapRejects;
	C_NetworkUtlVectorBase< int32 > m_vecMutedPlayers;
	bool m_bCommsRestricted;
	bool m_bPriorCommsAbuse;
	bool m_bIsNewPlayer;
	uint32 m_unEconAccountID;
	CHandle< C_CitadelPlayerPawn > m_hHeroPawn;
	// MNotSaved
	PlayerDataGlobal_t m_PlayerDataGlobal;
	int8 m_nDeathReplayAvailable;
	CitadelLobbyPlayerSlot_t m_unLobbyPlayerSlot;
	bool m_bHasCheckedFriendName;
	CUtlString m_sFriendName;
};
