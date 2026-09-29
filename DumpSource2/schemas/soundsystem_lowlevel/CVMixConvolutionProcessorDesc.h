// MGetKV3ClassDefaults = {
//	"_class": "CVMixConvolutionProcessorDesc",
//	"m_name": "",
//	"m_nDebugId": 0,
//	"m_flxfade": 0.100000,
//	"m_nChannels": -1,
//	"m_bDebugBypass": false,
//	"m_paramEnable":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramMix":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_desc":
//	{
//		"m_fldbGain": -12.000000,
//		"m_flPreDelayMS": 0.000000,
//		"m_flWetMix": 1.000000,
//		"m_fldbLow": 0.000000,
//		"m_fldbMid": 0.000000,
//		"m_fldbHigh": 0.000000,
//		"m_flLowCutoffFreq": 1500.000000,
//		"m_flHighCutoffFreq": 7500.000000
//	},
//	"m_paramImpulseResponse":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixConvolutionProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixConvolutionDesc_t m_desc;
	CVMixDataOffset m_paramImpulseResponse;
};
