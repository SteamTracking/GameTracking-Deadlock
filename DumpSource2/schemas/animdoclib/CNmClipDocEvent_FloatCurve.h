// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_FloatCurve",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_ID": "",
//	"m_curve":
//	{
//		"m_spline":
//		[
//		],
//		"m_tangents":
//		[
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			0.000000,
//			0.000000
//		]
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_FloatCurve : public CNmClipDocEvent
{
	CUtlString m_ID;
	CPiecewiseCurve m_curve;
};
