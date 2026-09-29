// MGetKV3ClassDefaults = {
//	"_class": "CNetworkedSequenceOperation",
//	"m_hSequence": -1,
//	"m_flPrevCycle": 0.000000,
//	"m_flCycle": 0.000000,
//	"m_flWeight": 1.000000,
//	"m_bSequenceChangeNetworked": false,
//	"m_bDiscontinuity": false,
//	"m_flPrevCycleFromDiscontinuity": 0.000000,
//	"m_flPrevCycleForAnimEventDetection": 0.000000
//}
// MHasKV3TransferPolymorphicClassname
class CNetworkedSequenceOperation
{
	HSequence m_hSequence;
	float32 m_flPrevCycle;
	float32 m_flCycle;
	CNetworkedQuantizedFloat m_flWeight;
	bool m_bSequenceChangeNetworked;
	bool m_bDiscontinuity;
	float32 m_flPrevCycleFromDiscontinuity;
	float32 m_flPrevCycleForAnimEventDetection;
};
