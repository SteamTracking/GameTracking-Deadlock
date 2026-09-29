// MGetKV3ClassDefaults = {
//	"_class": "CMovementStatsProperty",
//	"m_nUseCounter": 0,
//	"m_emaMovementDirection":
//	{
//		"m_nSampleCount": 0,
//		"m_nMaxSampleCount": 0,
//		"m_previousSample":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_average":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_averageDelta":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		]
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CMovementStatsProperty
{
	int32 m_nUseCounter;
	CVectorExponentialMovingAverage m_emaMovementDirection;
};
