// MGetKV3ClassDefaults = {
//	"m_flPlaneOffset": 0.000000,
//	"m_vPointOnPlane": null,
//	"m_vPlaneNorm":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flPlaneDist": 0.000000,
//	"m_bApplyToNpcCurrentPos": false,
//	"m_bIsThreatPlane": false,
//	"m_bIsOptional": false
//}
class TgPlane_t
{
	float32 m_flPlaneOffset;
	VectorWS m_vPointOnPlane;
	Vector m_vPlaneNorm;
	float32 m_flPlaneDist;
	bool m_bApplyToNpcCurrentPos;
	bool m_bIsThreatPlane;
	bool m_bIsOptional;
};
