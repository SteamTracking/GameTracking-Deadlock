// MGetKV3ClassDefaults = {
//	"m_srcChannels": "",
//	"m_dstChannels": "",
//	"m_mipAlgorithm":
//	{
//		"m_algorithm": "",
//		"m_stringArg": "",
//		"m_vFloat4Arg":
//		[
//			0.000000,
//			0.000000,
//			0.000000,
//			0.000000
//		]
//	},
//	"m_outputColorSpace": "",
//	"m_inputTextureArray":
//	[
//	]
//}
class CTextureOutputChannel
{
	CUtlString m_srcChannels;
	CUtlString m_dstChannels;
	CImageProcessor m_mipAlgorithm;
	CUtlString m_outputColorSpace;
	CUtlVector< CUtlString > m_inputTextureArray;
};
