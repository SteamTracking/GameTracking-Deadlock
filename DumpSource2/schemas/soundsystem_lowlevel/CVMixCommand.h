// MGetKV3ClassDefaults = {
//	"command": "CMD_INVALID",
//	"paramName": 0,
//	"outputSubmix":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	},
//	"inputSubmix0":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	},
//	"inputSubmix1":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	},
//	"processor": -1,
//	"m_nInputValue0":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	},
//	"m_nInputValue1":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	}
//}
class CVMixCommand
{
	// MKV3TransferName = "command"
	VMixGraphCommandID_t m_nCommand;
	// MKV3TransferName = "paramName"
	uint32 m_nParameterNameHash;
	// MKV3TransferName = "outputSubmix"
	CVMixDataOffset m_nOutputSubmix;
	// MKV3TransferName = "inputSubmix0"
	CVMixDataOffset m_nInputSubmix0;
	// MKV3TransferName = "inputSubmix1"
	CVMixDataOffset m_nInputSubmix1;
	// MKV3TransferName = "processor"
	int32 m_nProcessor;
	CVMixDataOffset m_nInputValue0;
	CVMixDataOffset m_nInputValue1;
};
