// MNetworkVarNames = "bool m_bHoldingBall"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_WreckingBall : public CCitadelBaseAbility
{
	ParticleIndex_t m_nBallParticle;
	ParticleIndex_t m_nCastCompleteParticle;
	CUtlVector< CHandle< CBaseEntity > > m_vecTargetsHit;
	// MNetworkEnable
	bool m_bHoldingBall;
};
