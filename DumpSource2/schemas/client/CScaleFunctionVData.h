// MVDataRoot
// MVDataNodeType = 1
// MVDataOverlayType = 1
// MHasKV3TransferPolymorphicClassname
class CScaleFunctionVData : public CEntitySubclassVDataBase
{
	EStatsType m_eSpecificStatScaleType; // = "EStatsCount"
	bool m_bFunctionDisabled;
	float32 m_flStatScale; // = 1
	float32 m_flStreetBrawlStatScale; // = 340282346638528859811704183484516925440
};
