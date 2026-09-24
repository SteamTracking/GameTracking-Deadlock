// MNetworkVarNames = "CCitadelMinimapComponent::Storage_t m_CCitadelMinimapComponent"
// MNetworkVarNames = "uint8 m_nEnableState"
// MClassHasEntityLimitedDataDesc
class CCitadelTriggerMultiCapturePoint : public CBaseTrigger
{
	// MNetworkEnable
	// MNetworkUserGroup = "CCitadelMinimapComponent"
	// MNetworkAlias = "CCitadelMinimapComponent"
	// MNetworkTypeAlias = "CCitadelMinimapComponent"
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CEntityIOOutput m_OnBecomeCapturable;
	CEntityOutputTemplate< int32 > m_OnFullyCaptured;
	CUtlSymbolLarge m_iszGroupName;
	ParticleIndex_t m_nEnabledParticle;
	ParticleIndex_t m_nPreEnableFX;
	// MNetworkEnable
	// MNetworkChangeCallback = "OnMultiEnableStateChanged"
	uint8 m_nEnableState;
};
