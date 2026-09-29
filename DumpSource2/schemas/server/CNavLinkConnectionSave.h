// MGetKV3ClassDefaults = {
//	"m_nLinkArea": 0,
//	"m_otherArea":
//	{
//		"m_hDeformable": null,
//		"m_nOtherAreaIdGlobalOrLocal": 4294967295
//	},
//	"m_vPortalALocal":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPortalBLocal":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_bIsEntry": false
//}
class CNavLinkConnectionSave
{
	// MNotSaved
	CHandle< CBaseEntity > m_hLinkEntity;
	uint32 m_nLinkArea;
	NavAreaSave_t m_otherArea;
	Vector m_vPortalALocal;
	Vector m_vPortalBLocal;
	bool m_bIsEntry;
};
