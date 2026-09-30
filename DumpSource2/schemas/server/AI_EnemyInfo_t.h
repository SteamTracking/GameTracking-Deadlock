// MHasKV3TransferPolymorphicClassname
class AI_EnemyInfo_t : public AI_EnemyInfoBase_t
{
	CRelativeLocation m_lastKnownLocation;
	CRelativeLocation m_lastSeenLocation;
	GameTime_t m_flLastKnownTime;
	GameTime_t m_flTimeValidEnemy;
	AI_EnemyEludingState_t m_nEludingState;
	bool m_bUnforgettable;
	bool m_bUnknownEnemy;
	AI_MemoryData_t[2] m_pMemoryTypeData;
};
