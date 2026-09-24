// MNetworkVarNames = "EHANDLE m_hTarget"
// MNetworkVarNames = "Vector m_vRiposteStartPosition"
// MNetworkVarNames = "Vector m_vDashDirection"
// MNetworkVarNames = "GameTime_t m_flStateStartTime"
// MNetworkVarNames = "uint8 m_nCurrentRiposteState"
// MNetworkVarNames = "GameTime_t m_flSuccessfulRiposteTime"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_Fencer_Riposte : public CCitadelBaseAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	CHandle< CBaseEntity > m_hTarget;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	Vector m_vRiposteStartPosition;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	Vector m_vDashDirection;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_flStateStartTime;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	uint8 m_nCurrentRiposteState;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_flSuccessfulRiposteTime;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEnemies;
	Vector m_vecLastPosition;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_nParriedFXIndex;
};
