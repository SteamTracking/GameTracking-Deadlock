// MHasKV3TransferPolymorphicClassname
class CCitadel_Destroyable_Building_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< bool > m_bHitTrigger;
	CAnimGraphParamRef< char* > m_eState;
	CAnimGraphParamRef< float32 > m_flHealth;
	CAnimGraphParamRef< bool > m_bActive;
	CAnimGraphParamRef< float32 > m_flHealthPercent;
	CAnimGraphParamRef< bool > m_bVulnerable;
	CAnimGraphParamRef< bool > m_bDestroyed;
	CAnimGraphParamRef< float32 > m_flExposedDurationFraction;
};
