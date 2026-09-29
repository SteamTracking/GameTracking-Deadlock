class CCitadel_Ability_Unicorn_LuminousStrike : public C_CitadelBaseAbility
{
	GameTime_t m_flLastStackChangeTime;
	int32 m_nLastStackCount;
	C_NetworkUtlVectorBase< GameTime_t > m_vecNextExplosionTime;
	C_NetworkUtlVectorBase< VectorWS > m_vecNextExplosionLocation;
	int32 m_nStackCount;
	bool m_bPendingStackUpdate;
};
