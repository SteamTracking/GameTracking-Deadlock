// MGetKV3ClassDefaults = {
//	"_class": "CNavLinkMovementVData_ClimbUp",
//	"m_sToolsOnlyOwnerModelName": "",
//	"m_vecAnimgraphVars":
//	[
//	],
//	"m_vecVariants":
//	[
//	],
//	"m_baseMetrics":
//	{
//		"m_horizontalRange": null,
//		"m_verticalRange": null
//	},
//	"m_bAlignOrientationWithEdgeNormal": false,
//	"m_metrics":
//	{
//		"m_flEntryDistance": 0.000000
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNavLinkMovementVData_ClimbUp : public CNavLinkMovementVData
{
	bool m_bAlignOrientationWithEdgeNormal;
	CNavLinkMetrics_ClimbUp m_metrics;
};
