class CProjectile_Stomp_Projectile : public CCitadelProjectile
{
	VectorWS m_vLastStompPos;
	bool m_bFinished;
	float32 m_flWidth;
	GameTime_t m_tDieTime;
};
