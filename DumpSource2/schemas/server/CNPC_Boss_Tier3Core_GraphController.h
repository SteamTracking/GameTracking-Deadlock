// MHasKV3TransferPolymorphicClassname
class CNPC_Boss_Tier3Core_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< bool > m_bCharge;
	CAnimGraph2ParamOptionalRef< bool > m_bDeath;
	CAnimGraph2ParamOptionalRef< bool > m_bExplode;
	CAnimGraph2ParamOptionalRef< bool > m_bIdle;
	CAnimGraph2ParamOptionalRef< bool > m_bReform;
	CAnimGraph2ParamOptionalRef< bool > m_bRelease;
	CAnimGraph2ParamOptionalRef< float32 > m_flChargeDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flDeathDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flExplodeDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flIdleDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flReformDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flReleaseDuration;
};
