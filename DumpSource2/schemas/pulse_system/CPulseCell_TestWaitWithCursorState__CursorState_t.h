// MGetKV3ClassDefaults = {
//	"flWaitValue": 0.000000,
//	"bFail": false,
//	"m_hSelfCursor":
//	{
//		"m_hGraph":
//		{
//			"m_nGraphID": 0
//		},
//		"m_nCursorID": -1,
//		"m_nYieldToken": -1
//	},
//	"m_hSelfCellInstanceUntyped":
//	{
//		"m_hGraph":
//		{
//			"m_nGraphID": 0
//		},
//		"m_nCellID": -1
//	},
//	"m_hSelfCellInstance":
//	{
//		"m_hGraph":
//		{
//			"m_nGraphID": 0
//		},
//		"m_nCellID": -1
//	}
//}
class CPulseCell_TestWaitWithCursorState::CursorState_t
{
	float32 flWaitValue;
	bool bFail;
	HYieldedCursor m_hSelfCursor;
	HPulseCellBase m_hSelfCellInstanceUntyped;
	HPulseCell< CPulseCell_TestWaitWithCursorState > m_hSelfCellInstance;
};
