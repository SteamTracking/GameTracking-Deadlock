class CSoundOpvarSetBoxEntity : public CSoundOpvarSetPointEntity
{
	Vector m_vDistanceInnerMins;
	Vector m_vDistanceInnerMaxs;
	Vector m_vDistanceOuterMins;
	Vector m_vDistanceOuterMaxs;
	int32 m_nBoxDirection;
	Vector m_vInnerMins;
	Vector m_vInnerMaxs;
	Vector m_vOuterMins;
	Vector m_vOuterMaxs;
};
