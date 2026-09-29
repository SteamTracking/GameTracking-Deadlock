// MGetKV3ClassDefaults = {
//	"_class": "CNmCameraFOVEvent",
//	"m_flStartTime":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_flDuration":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_syncID": "",
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
class CNmCameraFOVEvent : public CNmEvent
{
	CPiecewiseCurve m_curve;
};
