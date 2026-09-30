class PathAccompanyNode_t
{
	CUtlString m_sName;
	Vector m_vInitialPosition;
	float32 m_flRadius;
	float32 m_flRoll;
	bool m_bOverrideGaitInCombat;
	SharedMovementGait_t m_eMinMovementGait; // = "eInvalid"
	SharedMovementGait_t m_eMaxMovementGait; // = "eInvalid"
	VectorWS m_vWorldPosition;
	Vector m_vForward;
	Vector m_vLeft;
	float32 m_flDistToNext;
};
