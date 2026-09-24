// MNetworkVarNames = "int m_nPowerLevel"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_PowerSlash : public CCitadelBaseYamatoAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	int32 m_nPowerLevel;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitTargets;
	ParticleIndex_t m_nCastParticle;
};
