// MEntityAllowsPortraitWorldSpawn
// MNetworkVarNames = "fogparams_t m_fog"
// MNetworkNoBase
class CFogController : public CBaseEntity
{
	// MNetworkEnable
	// MNotSaved
	fogparams_t m_fog;
	bool m_bUseAngles;
	int32 m_iChangedVariables;
};
