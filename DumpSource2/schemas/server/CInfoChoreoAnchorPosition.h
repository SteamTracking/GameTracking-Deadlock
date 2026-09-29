// MGetKV3ClassDefaults = {
//	"m_vOriginLS":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_qAnglesLS":
//	[
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vExtentsMin":
//	[
//		0.000000,
//		-20.000000,
//		0.000000
//	],
//	"m_vExtentsMax":
//	[
//		0.000000,
//		20.000000,
//		0.000000
//	],
//	"m_flRadius": 12.000000,
//	"m_flToleranceAngle": 0.000000,
//	"m_bOnlyWarpPosition": false,
//	"m_hParent": null,
//	"m_nShapeType": "POINT"
//}
class CInfoChoreoAnchorPosition
{
	Vector m_vOriginLS;
	Quaternion m_qAnglesLS;
	Vector m_vExtentsMin;
	Vector m_vExtentsMax;
	float32 m_flRadius;
	float32 m_flToleranceAngle;
	bool m_bOnlyWarpPosition;
	CHandle< CBaseEntity > m_hParent;
	CInfoChoreoLocatorShapeType_t m_nShapeType;
};
