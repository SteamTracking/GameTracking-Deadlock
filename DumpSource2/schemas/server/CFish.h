// MNetworkNoBase
class CFish : public CBaseAnimGraph
{
	CHandle< CFishPool > m_pool;
	uint32 m_id;
	// MNotSaved
	float32 m_x;
	// MNotSaved
	float32 m_y;
	// MNotSaved
	float32 m_z;
	float32 m_angle;
	float32 m_angleChange;
	Vector m_forward;
	Vector m_perp;
	VectorWS m_poolOrigin;
	float32 m_waterLevel;
	float32 m_speed;
	float32 m_desiredSpeed;
	float32 m_calmSpeed;
	float32 m_panicSpeed;
	float32 m_avoidRange;
	// MNotSaved
	CountdownTimer m_turnTimer;
	bool m_turnClockwise;
	// MNotSaved
	CountdownTimer m_goTimer;
	// MNotSaved
	CountdownTimer m_moveTimer;
	// MNotSaved
	CountdownTimer m_panicTimer;
	// MNotSaved
	CountdownTimer m_disperseTimer;
	// MNotSaved
	CountdownTimer m_proximityTimer;
	// MNotSaved
	CUtlVector< CFish* > m_visible;
};
