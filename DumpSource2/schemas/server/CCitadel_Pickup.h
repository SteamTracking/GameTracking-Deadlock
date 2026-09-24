// MNetworkVarNames = "CCitadelMinimapComponent::Storage_t m_CCitadelMinimapComponent"
// MNetworkVarNames = "bool m_bActive"
// MNetworkVarNames = "bool m_bInteractive"
// MNetworkVarNames = "Vector m_vVacuumStartPos"
// MNetworkVarNames = "Vector m_vInitialVacuumVel"
// MNetworkVarNames = "CHandle< CBaseEntity> m_hVacuumTarget"
// MClassHasEntityLimitedDataDesc
class CCitadel_Pickup : public CBaseAnimGraph
{
	// MNetworkEnable
	// MNetworkUserGroup = "CCitadelMinimapComponent"
	// MNetworkAlias = "CCitadelMinimapComponent"
	// MNetworkTypeAlias = "CCitadelMinimapComponent"
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	// MNetworkEnable
	bool m_bActive;
	// MNetworkEnable
	bool m_bInteractive;
	// MNetworkEnable
	Vector m_vVacuumStartPos;
	// MNetworkEnable
	Vector m_vInitialVacuumVel;
	// MNetworkEnable
	CHandle< CBaseEntity > m_hVacuumTarget;
	VectorWS m_vVacuumPos;
	GameTime_t m_flVacuumStartTime;
	Vector m_vImpactVel;
	Vector m_vImpactPos;
	GameTime_t m_flImpactTime;
};
