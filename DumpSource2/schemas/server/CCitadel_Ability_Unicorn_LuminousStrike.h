class CCitadel_Ability_Unicorn_LuminousStrike : public CCitadelBaseAbility
{
	GameTime_t m_flLastStackChangeTime;
	int32 m_nLastStackCount;
	CNetworkUtlVectorBase< GameTime_t > m_vecNextExplosionTime;
	CNetworkUtlVectorBase< VectorWS > m_vecNextExplosionLocation;
	int32 m_nStackCount;
	bool m_bPendingStackUpdate;
};
