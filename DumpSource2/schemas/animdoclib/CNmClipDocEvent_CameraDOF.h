// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_CameraDOF",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_curve":
//	{
//		"m_spline":
//		[
//			{
//				"x": 0.000000,
//				"y": 0.000000,
//				"m_flSlopeIncoming": 1.000000,
//				"m_flSlopeOutgoing": 1.000000
//			},
//			{
//				"x": 1.000000,
//				"y": 1.000000,
//				"m_flSlopeIncoming": 1.000000,
//				"m_flSlopeOutgoing": 1.000000
//			}
//		],
//		"m_tangents":
//		[
//			{
//				"m_nIncomingTangent": "CURVE_TANGENT_SPLINE",
//				"m_nOutgoingTangent": "CURVE_TANGENT_SPLINE"
//			},
//			{
//				"m_nIncomingTangent": "CURVE_TANGENT_SPLINE",
//				"m_nOutgoingTangent": "CURVE_TANGENT_SPLINE"
//			}
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			1.000000,
//			1.000000
//		]
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_CameraDOF : public CNmClipDocEvent
{
	CPiecewiseCurve m_curve;
};
