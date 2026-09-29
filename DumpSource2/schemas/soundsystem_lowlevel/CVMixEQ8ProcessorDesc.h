// MGetKV3ClassDefaults = {
//	"_class": "CVMixEQ8ProcessorDesc",
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
//		"m_stages":
//		[
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			},
//			{
//				"m_fldbGain": 0.000000,
//				"m_flCutoffFreq": 1000.000000,
//				"m_flQ": 0.707107,
//				"m_nFilterType": "FILTER_UNKNOWN",
//				"m_nFilterSlope": "FILTER_SLOPE_12dB",
//				"m_bEnabled": true,
//				"m_nChannelSet": "FILTER_ALL_CHANNELS"
//			}
//		]
//	},
//	"m_paramEQScale":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixEQ8ProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixEQ8Desc_t m_desc;
	CVMixParameterFloat m_paramEQScale;
};
